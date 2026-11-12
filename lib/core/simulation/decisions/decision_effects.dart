import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/project.dart';

class DecisionEffects {
  const DecisionEffects({this.projects = const ProjectRules()});

  final ProjectRules projects;

  int cost(CityState state, List<DecisionEffect> effects) {
    var total = 0;
    for (final effect in effects) {
      total += switch (effect) {
        Spend(:final amount) => amount,
        OrderBuses(:final count, :final unitPrice) => count * unitPrice,
        LaunchProject(:final type, :final district, :final discount) =>
          (projects.cost(state, type, district: district) * (1 - discount)).round(),
        _ => 0,
      };
    }
    return total;
  }

  List<RejectionReason> problems(CityState state, List<DecisionEffect> effects) {
    final problems = <RejectionReason>{};
    if (state.budget < cost(state, effects)) {
      problems.add(RejectionReason.insufficientFunds);
    }
    for (final effect in effects) {
      switch (effect) {
        case OrderBuses(:final count) when state.fleet.length + count > state.depotCapacity:
          problems.add(RejectionReason.depotFull);
        case LaunchProject(:final type, :final district):
          final rejection = projects.validate(state, type, district: district);
          if (rejection != null && rejection != RejectionReason.insufficientFunds) {
            problems.add(rejection);
          }
        default:
          break;
      }
    }
    return problems.toList();
  }

  (CityState, List<CityEvent>) apply(CityState state, List<DecisionEffect> effects) {
    var next = state;
    final events = <CityEvent>[];
    for (final effect in effects) {
      switch (effect) {
        case Spend(:final amount):
          next = _record(next, LedgerItem.decisions, -amount);
        case Earn(:final amount):
          next = _record(next, LedgerItem.decisions, amount);
        case Mood(:final group, :final delta):
          next = next.copyWith(
            satisfaction: {
              ...next.satisfaction,
              group: ((next.satisfaction[group] ?? 50) + delta).clamp(0, 100).toDouble(),
            },
          );
        case Reputation(:final delta):
          events.add(ReputationShift(delta));
        case RoadDamage(:final district, :final amount):
          next = next.copyWith(
            districts: [
              for (final current in next.districts)
                current.id == district
                    ? current.copyWith(roadCondition: math.max(current.roadCondition - amount, 0))
                    : current,
            ],
          );
        case RoadRestore(:final district):
          next = next.copyWith(
            districts: [
              for (final current in next.districts)
                current.id == district ? current.copyWith(roadCondition: 100) : current,
            ],
          );
        case Modify(:final type, :final value, :final seconds, :final district, :final group):
          next = next.copyWith(
            modifiers: [
              ...next.modifiers,
              ActiveModifier(
                type: type,
                value: value,
                remainingSeconds: seconds,
                district: district,
                group: group,
              ),
            ],
          );
        case OrderBuses(:final model, :final count, :final district, :final unitPrice):
          next = _record(next, LedgerItem.vehiclePurchases, -count * unitPrice);
          next = next.copyWith(
            fleet: [
              ...next.fleet,
              for (var index = 0; index < count; index++)
                Bus(
                  id: next.nextId + index,
                  model: model,
                  districtId: district,
                  deliveryTick: next.tick + GameBalance.busDeliverySeconds,
                ),
            ],
            nextId: next.nextId + count,
            stats: next.stats.copyWith(busesBought: next.stats.busesBought + count),
          );
          events.addAll([
            for (var index = 0; index < count; index++) BusPurchased(model, district),
          ]);
        case LaunchProject(:final type, :final district, :final discount):
          final seconds = projects.duration(next, type, district: district);
          final price = (projects.cost(next, type, district: district) * (1 - discount)).round();
          next = _record(next, LedgerItem.construction, -price).copyWith(
            projects: [
              ...next.projects,
              Project(
                id: next.nextId,
                type: type,
                districtId: district,
                totalSeconds: seconds,
                remainingSeconds: seconds,
              ),
            ],
            nextId: next.nextId + 1,
          );
          events.add(ProjectStarted(type, district));
        case LoseBuses(:final count, :final district):
          final victims =
              (next.activeBuses
                      .where((bus) => district == null || bus.districtId == district)
                      .toList()
                    ..sort((a, b) => b.ageSeconds.compareTo(a.ageSeconds)))
                  .take(count)
                  .map((bus) => bus.id)
                  .toSet();
          next = next.copyWith(
            fleet: [
              for (final bus in next.fleet)
                if (!victims.contains(bus.id)) bus,
            ],
          );
        case ChangeFare(:final delta):
          next = next.copyWith(
            fare: (next.fare + delta).clamp(GameBalance.minFare, GameBalance.maxFare),
          );
      }
    }
    return (next, events);
  }

  CityState _record(CityState state, LedgerItem item, int amount) {
    return state.copyWith(
      budget: state.budget + amount,
      pendingLedger: {...state.pendingLedger, item: (state.pendingLedger[item] ?? 0) + amount},
    );
  }
}
