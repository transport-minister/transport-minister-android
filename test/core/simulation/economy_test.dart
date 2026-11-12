import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';

import 'simulation_test_kit.dart';

void main() {
  const economy = EconomyCalculator();
  const metrics = MetricsCalculator();

  Map<LedgerItem, int> ledger(CityState city) =>
      economy.operatingLedger(city, metrics.calculate(city));

  int earnings(CityState city) => ledger(city).values.fold(0, (sum, amount) => sum + amount);

  test('a new bus where people wait brings in clearly more money every second', () {
    final city = newBaku();
    final slowest = metrics
        .calculate(city)
        .districts
        .reduce((a, b) => b.waitingMinutes > a.waitingMinutes ? b : a)
        .id;
    final ordered = applied(
      const CityCommands().buyBus(city, model: BusModelId.cityRunner, district: slowest),
    );
    final running = ordered.copyWith(tick: ordered.tick + GameBalance.busDeliverySeconds);

    expect(earnings(running) - earnings(city), greaterThan(20));
  });

  test('every city level grows the Cabinet budget', () {
    final city = newBaku();
    final grown = city.copyWith(developmentPoints: CityLevels.pointsFor(5));

    expect(
      ledger(grown)[LedgerItem.governmentBudget]! / ledger(city)[LedgerItem.governmentBudget]!,
      closeTo(1 + 4 * CityLevels.budgetRaisePercent / 100, 0.01),
    );
  });
}
