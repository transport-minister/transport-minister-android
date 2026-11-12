import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
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
          (metrics.riders * state.fare / 100 * state.multiplier(ModifierType.ticketRevenue))
              .round(),
      LedgerItem.subsidy:
          (GameBalance.dailySubsidy *
                  (0.6 + state.overallSatisfaction / 100 * 0.8) *
                  state.multiplier(ModifierType.subsidy))
              .round(),
      LedgerItem.energy:
          -(performances.fold(0, (sum, bus) => sum + bus.energyPerDay) *
                  state.multiplier(ModifierType.energyCost))
              .round(),
      LedgerItem.salaries:
          -(performances.length *
                  GameBalance.driverWagePerBusDay *
                  state.multiplier(ModifierType.salaryCost))
              .round(),
      LedgerItem.vehicleMaintenance:
          -(performances.fold(0, (sum, bus) => sum + bus.maintenancePerDay) *
                  state.multiplier(ModifierType.maintenanceCost))
              .round(),
      LedgerItem.roadMaintenance: -state.districts.length * state.roadMaintenance.costPerDistrict,
      LedgerItem.administration: -GameBalance.administrationPerDay,
      if (loan != null) LedgerItem.loanRepayment: -loan.dailyInstallment,
      LedgerItem.decisions:
          (state.additive(ModifierType.dailyIncome) - state.additive(ModifierType.dailyCost))
              .round(),
    };
    ledger.removeWhere((_, amount) => amount == 0);
    return ledger;
  }

  int monthlyAllocation(double overallSatisfaction) {
    final factor = math.min(
      math.max(0.4 + overallSatisfaction / 100 * 1.2, GameBalance.minAllocationFactor),
      GameBalance.maxAllocationFactor,
    );
    return (GameBalance.monthlyAllocationBase * factor).round();
  }
}
