import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/diplomacy_actions.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_stats.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/simulation/model/district_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/loan.dart';
import 'package:transport_minister/core/simulation/model/metro_line.dart';
import 'package:transport_minister/core/simulation/model/pending_decision.dart';
import 'package:transport_minister/core/simulation/model/project.dart';
import 'package:transport_minister/core/simulation/model/road_maintenance_level.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

part 'city_state.freezed.dart';
part 'city_state.g.dart';

@freezed
abstract class CityState with _$CityState {
  const factory CityState({
    required int seed,
    required int tick,
    required int budget,
    required int fare,
    required int depotCapacity,
    required RoadMaintenanceLevel roadMaintenance,
    required List<DistrictState> districts,
    required List<Bus> fleet,
    required Map<StakeholderGroup, double> satisfaction,
    @Default([]) List<Project> projects,
    @Default(false) bool hasChargingDepot,
    Loan? loan,
    @Default(CrisisState()) CrisisState crisis,
    @Default(CityStats()) CityStats stats,
    @Default({}) Map<LedgerItem, int> pendingLedger,
    @Default(1) int nextId,
    @Default(0) int developmentPoints,
    @Default([]) List<PendingDecision> decisions,
    @Default([]) List<ActiveModifier> modifiers,
    @Default([]) List<DecisionRecord> decisionLog,
    @Default(0) int lastDecisionTick,
    @Default(0) int diplomacyPoints,
    @Default({}) Set<TechnologyId> technologies,
    @Default({}) Map<DiplomacyActionId, int> diplomacyReadyAt,
    @Default([]) List<MetroLine> metroLines,
    @Default(false) bool completed,
    @Default(0) int boostEndsAtTick,
    @Default(false) bool videoContinueUsed,
  }) = _CityState;

  const CityState._();

  factory CityState.fromJson(Map<String, dynamic> json) => _$CityStateFromJson(json);

  DistrictState district(DistrictId id) => districts.firstWhere((district) => district.id == id);

  Iterable<Bus> get activeBuses => fleet.where((bus) => bus.isActiveAt(tick));

  Iterable<Bus> busesIn(DistrictId id) => activeBuses.where((bus) => bus.districtId == id);

  double get overallSatisfaction => StakeholderGroup.overall(satisfaction);

  int get level => CityLevels.levelFor(developmentPoints);

  bool has(TechnologyId? technology) => technology == null || technologies.contains(technology);

  bool get metroAutomated => has(TechnologyId.metroAutomation);

  bool get boostActive => tick < boostEndsAtTick;

  int get boostSecondsLeft => math.max(boostEndsAtTick - tick, 0);

  Iterable<MetroLine> metroLinesAt(DistrictId district) =>
      metroLines.where((line) => line.connects(district));

  double multiplier(ModifierType type, {DistrictId? district}) => modifiers
      .where((modifier) => modifier.type == type && _covers(modifier, district))
      .fold(1, (product, modifier) => product * modifier.value);

  double additive(ModifierType type, {DistrictId? district, StakeholderGroup? group}) => modifiers
      .where(
        (modifier) =>
            modifier.type == type &&
            _covers(modifier, district) &&
            (group == null || modifier.group == null || modifier.group == group),
      )
      .fold(0, (sum, modifier) => sum + modifier.value);

  bool _covers(ActiveModifier modifier, DistrictId? district) =>
      modifier.district == null || modifier.district == district;
}
