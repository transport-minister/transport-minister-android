import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/metro_rules.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/metro_line.dart';

import 'simulation_test_kit.dart';

void main() {
  const commands = CityCommands();
  const metrics = MetricsCalculator();

  CityState contracted() => newBaku().copyWith(technologies: {TechnologyId.metroContract});

  CityState withLine({required int remainingSeconds, Set<TechnologyId> technologies = const {}}) =>
      newBaku().copyWith(
        technologies: technologies,
        metroLines: [
          MetroLine(
            from: DistrictId.oldFortress,
            to: DistrictId.windHeights,
            totalSeconds: MetroRules.buildSeconds,
            remainingSeconds: remainingSeconds,
          ),
        ],
      );

  test('metro lines need the contract and neighbouring districts', () {
    expect(
      commands.metroProblem(newBaku(), DistrictId.oldFortress, DistrictId.windHeights),
      RejectionReason.locked,
    );
    expect(
      commands.metroProblem(contracted(), DistrictId.windHeights, DistrictId.oilHarbor),
      RejectionReason.invalidTarget,
    );
    expect(
      commands.metroProblem(
        contracted().copyWith(budget: MetroRules.buildCost - 1),
        DistrictId.oldFortress,
        DistrictId.windHeights,
      ),
      RejectionReason.insufficientFunds,
    );
  });

  test('digging a line costs money and keeps the crew busy', () {
    final city = contracted();

    final digging = applied(
      commands.buildMetroLine(city, DistrictId.oldFortress, DistrictId.windHeights),
    );

    expect(digging.budget, city.budget - MetroRules.buildCost);
    expect(digging.metroLines.single.remainingSeconds, MetroRules.buildSeconds);
    expect(
      rejected(commands.buildMetroLine(digging, DistrictId.windHeights, DistrictId.oldFortress)),
      RejectionReason.alreadyBuilt,
    );
    expect(
      rejected(commands.buildMetroLine(digging, DistrictId.oldFortress, DistrictId.oilHarbor)),
      RejectionReason.tunnelBusy,
    );
  });

  test('a line opens after digging and earns city points', () {
    final city = applied(
      commands.buildMetroLine(contracted(), DistrictId.oldFortress, DistrictId.windHeights),
    );

    final result = runSeconds(city, MetroRules.buildSeconds);

    expect(result.state.metroLines.single.isOpen, isTrue);
    expect(result.events.whereType<MetroLineOpened>(), hasLength(1));
  });

  test('stations carry riders and take cars off the road', () {
    final before = metrics.calculate(newBaku()).of(DistrictId.oldFortress);
    final digging = metrics.calculate(withLine(remainingSeconds: 3)).of(DistrictId.oldFortress);
    final open = metrics.calculate(withLine(remainingSeconds: 0)).of(DistrictId.oldFortress);

    expect(digging.congestion, greaterThan(before.congestion));
    expect(open.congestion, lessThan(before.congestion));
    expect(open.capacity, greaterThanOrEqualTo(before.capacity + MetroRules.ridersPerStation));
    expect(open.waitingMinutes, lessThan(before.waitingMinutes));
  });

  test('open lines cost money every day and driverless trains are cheaper', () {
    const economy = EconomyCalculator();
    final manual = withLine(remainingSeconds: 0);
    final driverless = withLine(remainingSeconds: 0, technologies: {TechnologyId.metroAutomation});

    expect(
      economy.operatingLedger(manual, metrics.calculate(manual))[LedgerItem.metro],
      -MetroRules.costPerSecond,
    );
    expect(
      economy.operatingLedger(driverless, metrics.calculate(driverless))[LedgerItem.metro],
      -MetroRules.lineCost(automated: true),
    );
    expect(
      metrics.calculate(driverless).of(DistrictId.windHeights).capacity,
      greaterThan(metrics.calculate(manual).of(DistrictId.windHeights).capacity),
    );
  });
}
