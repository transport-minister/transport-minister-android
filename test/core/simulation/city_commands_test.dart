import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/satisfaction_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  const commands = CityCommands();

  group('buying buses', () {
    test('pays the price and waits for delivery', () {
      final city = newBaku();

      final bought = applied(
        commands.buyBus(city, model: BusModelId.cityRunner, district: DistrictId.windHeights),
      );

      expect(bought.budget, city.budget - BusModelId.cityRunner.spec.price);
      expect(bought.fleet, hasLength(city.fleet.length + 1));
      expect(bought.activeBuses.length, city.activeBuses.length);
      expect(bought.pendingLedger[LedgerItem.vehiclePurchases], -210000);
    });

    test('is refused without money, depot space or a charging depot', () {
      final city = newBaku();

      expect(
        rejected(
          commands.buyBus(
            city.copyWith(budget: 1000),
            model: BusModelId.veteran,
            district: DistrictId.flameHills,
          ),
        ),
        RejectionReason.insufficientFunds,
      );
      expect(
        rejected(
          commands.buyBus(
            city.copyWith(depotCapacity: city.fleet.length),
            model: BusModelId.veteran,
            district: DistrictId.flameHills,
          ),
        ),
        RejectionReason.depotFull,
      );
      expect(
        rejected(commands.buyBus(city, model: BusModelId.voltaE, district: DistrictId.flameHills)),
        RejectionReason.locked,
      );
      expect(
        rejected(
          commands.buyBus(
            city.copyWith(technologies: {TechnologyId.electricContract}),
            model: BusModelId.voltaE,
            district: DistrictId.flameHills,
          ),
        ),
        RejectionReason.requiresChargingDepot,
      );
    });
  });

  group('bus contracts', () {
    test('order several buses with one announcement', () {
      final city = newBaku();

      final outcome = commands.buyBuses(
        city,
        model: BusModelId.cityRunner,
        district: DistrictId.oldFortress,
        count: 3,
      );
      final bought = applied(outcome);
      final purchases = switch (outcome) {
        CommandApplied(:final events) => events.whereType<BusPurchased>().toList(),
        CommandRejected() => const <BusPurchased>[],
      };

      expect(bought.budget, city.budget - 3 * BusModelId.cityRunner.spec.price);
      expect(bought.fleet, hasLength(city.fleet.length + 3));
      expect(bought.stats.busesBought, city.stats.busesBought + 3);
      expect(purchases.single.count, 3);
    });

    test('are all or nothing', () {
      final city = newBaku();

      expect(
        rejected(
          commands.buyBuses(
            city.copyWith(depotCapacity: city.fleet.length + 2),
            model: BusModelId.veteran,
            district: DistrictId.oldFortress,
            count: 3,
          ),
        ),
        RejectionReason.depotFull,
      );
      expect(
        rejected(
          commands.buyBuses(
            city.copyWith(budget: 2 * BusModelId.veteran.spec.price),
            model: BusModelId.veteran,
            district: DistrictId.oldFortress,
            count: 3,
          ),
        ),
        RejectionReason.insufficientFunds,
      );
      expect(
        rejected(
          commands.buyBuses(
            city,
            model: BusModelId.veteran,
            district: DistrictId.oldFortress,
            count: 0,
          ),
        ),
        RejectionReason.invalidTarget,
      );
    });
  });

  test('upgrade problems explain what stops a bus from improving', () {
    final city = newBaku();
    final bus = city.activeBuses.first;
    final tuned = city.copyWith(technologies: {TechnologyId.engineTuning});

    expect(commands.upgradeProblem(city, bus), RejectionReason.locked);
    expect(commands.upgradeProblem(tuned, bus), isNull);
    expect(
      commands.upgradeProblem(tuned.copyWith(budget: 0), bus),
      RejectionReason.insufficientFunds,
    );
    expect(
      commands.upgradeProblem(tuned, bus.copyWith(level: BusUpgrades.maxLevel)),
      RejectionReason.maxLevelReached,
    );
  });

  test('upgrades raise the level until the maximum', () {
    var city = newBaku().copyWith(
      technologies: {
        TechnologyId.engineTuning,
        TechnologyId.biggerCabins,
        TechnologyId.comfortKit,
        TechnologyId.smartBuses,
      },
    );
    final busId = city.fleet.first.id;

    for (var level = 2; level <= BusUpgrades.maxLevel; level++) {
      city = applied(commands.upgradeBus(city, busId));
    }

    expect(city.fleet.first.level, BusUpgrades.maxLevel);
    expect(city.stats.busUpgrades, 4);
    expect(rejected(commands.upgradeBus(city, busId)), RejectionReason.maxLevelReached);
  });

  test('selling a bus returns part of its value', () {
    final city = newBaku();

    final sold = applied(commands.sellBus(city, city.fleet.first.id));

    expect(sold.fleet, hasLength(city.fleet.length - 1));
    expect(sold.budget, greaterThan(city.budget));
    expect(sold.budget - city.budget, lessThan(BusModelId.veteran.spec.price));
  });

  test('fares must stay in range and on the fare step', () {
    final city = newBaku();

    expect(applied(commands.setFare(city, 80)).fare, 80);
    expect(rejected(commands.setFare(city, 85)), RejectionReason.fareOutOfRange);
    expect(rejected(commands.setFare(city, 500)), RejectionReason.fareOutOfRange);
  });

  test('raising fares earns more on packed buses but upsets passengers', () {
    const metrics = MetricsCalculator();
    const satisfaction = SatisfactionCalculator();
    const economy = EconomyCalculator();
    final cheap = newBaku();
    final expensive = applied(commands.setFare(cheap, 90));

    final cheapTickets = economy.operatingLedger(
      cheap,
      metrics.calculate(cheap),
    )[LedgerItem.tickets]!;
    final expensiveTickets = economy.operatingLedger(
      expensive,
      metrics.calculate(expensive),
    )[LedgerItem.tickets]!;
    final cheapMood = satisfaction.targets(cheap, metrics.calculate(cheap));
    final expensiveMood = satisfaction.targets(expensive, metrics.calculate(expensive));

    expect(expensiveTickets, greaterThan(cheapTickets));
    expect(
      expensiveMood[StakeholderGroup.passengers],
      lessThan(cheapMood[StakeholderGroup.passengers]!),
    );
  });

  group('projects', () {
    test('respect the limit of parallel construction', () {
      var city = newBaku();
      city = applied(
        commands.startProject(city, ProjectType.roadRepair, district: DistrictId.oilHarbor),
      );
      city = applied(commands.startProject(city, ProjectType.chargingDepot));

      expect(
        rejected(
          commands.startProject(city, ProjectType.bikeLanes, district: DistrictId.flameHills),
        ),
        RejectionReason.projectLimitReached,
      );
    });

    test('cannot overlap in one district or repeat what exists', () {
      final city = applied(
        commands.startProject(newBaku(), ProjectType.roadRepair, district: DistrictId.oilHarbor),
      );

      expect(
        rejected(
          commands.startProject(city, ProjectType.bikeLanes, district: DistrictId.oilHarbor),
        ),
        RejectionReason.alreadyInProgress,
      );
      expect(
        rejected(
          commands.startProject(
            newBaku().copyWith(hasChargingDepot: true),
            ProjectType.chargingDepot,
          ),
        ),
        RejectionReason.alreadyBuilt,
      );
    });

    test('need a district unless they are city wide', () {
      expect(
        rejected(commands.startProject(newBaku(), ProjectType.bikeLanes)),
        RejectionReason.invalidTarget,
      );
    });
  });

  test('only one loan at a time', () {
    final borrowed = applied(commands.takeLoan(newBaku(), 500000));

    expect(rejected(commands.takeLoan(borrowed, 500000)), RejectionReason.loanActive);
  });
}
