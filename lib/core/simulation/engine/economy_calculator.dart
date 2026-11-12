import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/metro_rules.dart';
import 'package:transport_minister/core/simulation/engine/bus_performance.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';

class EconomyCalculator {
  const EconomyCalculator();

  Map<LedgerItem, int> operatingLedger(CityState state, CityMetrics metrics) {
    final performances = state.activeBuses.map(BusPerformance.of).toList();
    final loan = state.loan;
    final ledger = {
      LedgerItem.tickets:
          (metrics.riders *
                  state.fare /
                  100 *
                  GameBalance.ticketsPerRider *
                  state.multiplier(ModifierType.ticketRevenue))
              .round(),
      LedgerItem.governmentBudget:
          (GameBalance.budgetPerSecond *
                  CityLevels.budgetBonus(state.level) *
                  budgetFactor(state.overallSatisfaction) *
                  state.multiplier(ModifierType.subsidy))
              .round(),
      LedgerItem.energy:
          -(performances.fold(0.0, (sum, bus) => sum + bus.energyPerSecond) *
                  state.multiplier(ModifierType.energyCost))
              .round(),
      LedgerItem.salaries:
          -(performances.length *
                  GameBalance.driverWagePerBusSecond *
                  state.multiplier(ModifierType.salaryCost))
              .round(),
      LedgerItem.vehicleMaintenance:
          -(performances.fold(0.0, (sum, bus) => sum + bus.maintenancePerSecond) *
                  state.multiplier(ModifierType.maintenanceCost))
              .round(),
      LedgerItem.roadMaintenance: -state.districts.length * state.roadMaintenance.costPerDistrict,
      LedgerItem.administration: -GameBalance.administrationPerSecond,
      if (loan != null) LedgerItem.loanRepayment: -loan.installment,
      LedgerItem.metro:
          -state.metroLines.where((line) => line.isOpen).length *
          MetroRules.lineCost(automated: state.metroAutomated),
      LedgerItem.decisions:
          (state.additive(ModifierType.extraIncome) - state.additive(ModifierType.extraCost))
              .round(),
    };
    ledger.removeWhere((_, amount) => amount == 0);
    return ledger;
  }

  static double budgetFactor(double overallSatisfaction) => math.min(
    math.max(0.4 + overallSatisfaction / 100 * 1.2, GameBalance.minBudgetFactor),
    GameBalance.maxBudgetFactor,
  );
}
