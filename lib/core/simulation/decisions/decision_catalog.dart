import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

class DecisionContext {
  const DecisionContext(this.city, this.metrics);

  final CityState city;
  final CityMetrics metrics;

  double mood(StakeholderGroup group) => city.satisfaction[group] ?? 50;

  DistrictMetrics get worstService =>
      metrics.districts.reduce((a, b) => b.serviceRatio < a.serviceRatio ? b : a);

  DistrictMetrics get mostCongested =>
      metrics.districts.reduce((a, b) => b.congestion > a.congestion ? b : a);

  DistrictMetrics get leastSafe => metrics.districts.reduce((a, b) => b.safety < a.safety ? b : a);

  DistrictId get worstRoad =>
      city.districts.reduce((a, b) => b.roadCondition < a.roadCondition ? b : a).id;
}

typedef OptionsBuilder = List<DecisionOption> Function(
  DecisionContext context,
  DistrictId? district,
);

class DecisionTemplate {
  const DecisionTemplate({
    required this.id,
    required this.weight,
    required this.options,
    this.district,
    this.arrival,
  });

  final DecisionId id;
  final double Function(DecisionContext context) weight;
  final DistrictId? Function(DecisionContext context, math.Random random)? district;
  final OptionsBuilder options;
  final List<DecisionEffect> Function(DecisionContext context, DistrictId? district)? arrival;

  int get expiresIn => id.kind == DecisionKind.disaster ? 2 : 3;
}

abstract final class DecisionCatalog {
  static DecisionTemplate of(DecisionId id) => all.firstWhere((template) => template.id == id);

  static final all = <DecisionTemplate>[
    DecisionTemplate(
      id: DecisionId.overcrowdedBuses,
      weight: (c) => c.worstService.serviceRatio < 0.6 ? 3 : 0,
      district: (c, _) => c.worstService.id,
      options: (c, d) => [
        DecisionOption([
          OrderBuses(BusModelId.cityRunner, 3, d!, _discounted(BusModelId.cityRunner, 0.15)),
          const Mood(StakeholderGroup.passengers, 4),
        ]),
        DecisionOption([
          Modify(ModifierType.capacity, 1.25, 5, district: d),
          const Modify(ModifierType.dailyCost, 8000, 5),
          const Mood(StakeholderGroup.transportWorkers, -3),
        ]),
        const DecisionOption([Mood(StakeholderGroup.passengers, -6), Reputation(-2)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.potholes,
      weight: (c) => c.city.district(c.worstRoad).roadCondition < 40 ? 3 : 0,
      district: (c, _) => c.worstRoad,
      options: (c, d) => [
        DecisionOption([
          Spend(
            (const ProjectRules().cost(c.city, ProjectType.roadRepair, district: d) * 1.5).round(),
          ),
          RoadRestore(d!),
          const Mood(StakeholderGroup.drivers, 4),
        ]),
        DecisionOption([LaunchProject(ProjectType.roadRepair, d)]),
        DecisionOption(
          const [Mood(StakeholderGroup.drivers, -5)],
          risk: DecisionRisk(0.25, [
            const Mood(StakeholderGroup.passengers, -4),
            const Reputation(-3),
            Modify(ModifierType.safety, -10, 10, district: d),
          ]),
        ),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.bikePetition,
      weight: (c) => _bikeTarget(c) == null ? 0 : 2,
      district: (c, _) => _bikeTarget(c),
      options: (c, d) => [
        DecisionOption([
          LaunchProject(ProjectType.bikeLanes, d, discount: 0.3),
          const Mood(StakeholderGroup.environmentalists, 6),
          const Mood(StakeholderGroup.cyclists, 6),
        ]),
        const DecisionOption([
          Spend(20000),
          Mood(StakeholderGroup.environmentalists, 3),
          Mood(StakeholderGroup.cyclists, 2),
        ]),
        const DecisionOption([
          Mood(StakeholderGroup.environmentalists, -8),
          Mood(StakeholderGroup.cyclists, -8),
        ]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.parkingChaos,
      weight: (c) =>
          c.mood(StakeholderGroup.drivers) < 45 && c.mostCongested.congestion > 55 ? 2 : 0,
      district: (c, _) => c.mostCongested.id,
      options: (c, d) => [
        DecisionOption([
          const Modify(ModifierType.dailyIncome, 3000, 30),
          Modify(ModifierType.congestion, -8, 30, district: d),
          const Mood(StakeholderGroup.drivers, -8),
        ]),
        DecisionOption([
          const Spend(180000),
          Modify(ModifierType.congestion, -5, 60, district: d),
          const Mood(StakeholderGroup.drivers, 6),
          const Mood(StakeholderGroup.businesses, 3),
        ]),
        const DecisionOption([
          Mood(StakeholderGroup.drivers, -4),
          Mood(StakeholderGroup.businesses, -3),
        ]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.driverWages,
      weight: (c) {
        if (c.city.modifiers.any((modifier) => modifier.type == ModifierType.salaryCost)) {
          return 0;
        }
        return c.mood(StakeholderGroup.transportWorkers) < 45 ? 3 : 0.3;
      },
      options: (c, d) => const [
        DecisionOption([
          Modify(ModifierType.salaryCost, 1.15, 120),
          Mood(StakeholderGroup.transportWorkers, 15),
        ]),
        DecisionOption([Spend(60000), Mood(StakeholderGroup.transportWorkers, 8)]),
        DecisionOption(
          [Mood(StakeholderGroup.transportWorkers, -6)],
          risk: DecisionRisk(0.4, [
            Modify(ModifierType.capacity, 0.5, 2),
            Mood(StakeholderGroup.passengers, -10),
            Reputation(-4),
          ]),
        ),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.trafficAccident,
      weight: (c) =>
          c.leastSafe.safety < 50 && !c.city.district(c.leastSafe.id).hasSmartSignals ? 2 : 0,
      district: (c, _) => c.leastSafe.id,
      options: (c, d) => [
        DecisionOption([
          LaunchProject(ProjectType.smartSignals, d, discount: 0.2),
          const Mood(StakeholderGroup.pedestrians, 4),
        ]),
        DecisionOption([
          const Spend(40000),
          Modify(ModifierType.safety, 8, 20, district: d),
          const Mood(StakeholderGroup.pedestrians, 3),
        ]),
        const DecisionOption([Mood(StakeholderGroup.pedestrians, -8), Reputation(-3)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.fuelSpike,
      weight: (c) => c.city.activeBuses.any((bus) => !bus.model.spec.electric) ? 1 : 0,
      options: (c, d) => const [
        DecisionOption([Spend(80000), Modify(ModifierType.energyCost, 1.05, 10)]),
        DecisionOption([
          Modify(ModifierType.energyCost, 1.3, 10),
          Modify(ModifierType.ticketRevenue, 1.15, 10),
          Mood(StakeholderGroup.passengers, -6),
        ]),
        DecisionOption([Modify(ModifierType.energyCost, 1.3, 10)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.busDiscount,
      weight: (c) => c.city.depotCapacity - c.city.fleet.length >= 2 ? 1 : 0,
      district: (c, _) => c.worstService.id,
      options: (c, d) => [
        DecisionOption([
          OrderBuses(BusModelId.cityRunner, 2, d!, _discounted(BusModelId.cityRunner, 0.25)),
        ]),
        DecisionOption([
          OrderBuses(BusModelId.cityRunner, 5, d, _discounted(BusModelId.cityRunner, 0.25)),
        ]),
        const DecisionOption([]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.privateOperator,
      weight: (c) => c.city.day > 10 && c.worstService.serviceRatio < 0.7 ? 1.5 : 0,
      district: (c, _) => c.worstService.id,
      options: (c, d) => [
        DecisionOption([
          Modify(ModifierType.capacity, 1.3, 30, district: d),
          const Modify(ModifierType.ticketRevenue, 0.9, 30),
          const Mood(StakeholderGroup.transportWorkers, -6),
          const Mood(StakeholderGroup.passengers, 5),
        ]),
        DecisionOption([
          Modify(ModifierType.capacity, 1.3, 30, district: d),
          const Modify(ModifierType.ticketRevenue, 0.95, 30),
          const Mood(StakeholderGroup.passengers, 5),
        ], risk: const DecisionRisk(0.5, [Reputation(-1)], replacesOutcome: true)),
        const DecisionOption([Mood(StakeholderGroup.passengers, -2)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.budgetHearing,
      weight: (c) => c.city.day > 15 && !_recently(c.city, DecisionId.budgetHearing, 25) ? 1.2 : 0,
      options: (c, d) => [
        DecisionOption(
          [Earn(c.city.overallSatisfaction >= 50 ? 600000 : 300000)],
          risk: c.city.overallSatisfaction >= 50
              ? null
              : const DecisionRisk(0.5, [Reputation(-3)], replacesOutcome: true),
        ),
        const DecisionOption([Modify(ModifierType.subsidy, 1.3, 30)]),
        const DecisionOption([Spend(150000), Reputation(6)]),
        const DecisionOption([Reputation(-2)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.festival,
      weight: (c) => _recently(c.city, DecisionId.festival, 20) ? 0 : 0.8,
      options: (c, d) => const [
        DecisionOption([
          Spend(30000),
          Modify(ModifierType.demand, 1.4, 2, district: DistrictId.seasideBoulevard),
          Mood(StakeholderGroup.passengers, 5),
          Mood(StakeholderGroup.businesses, 5),
        ]),
        DecisionOption([
          Modify(ModifierType.congestion, 15, 2, district: DistrictId.seasideBoulevard),
          Mood(StakeholderGroup.pedestrians, 8),
          Mood(StakeholderGroup.drivers, -6),
        ]),
        DecisionOption([
          Modify(ModifierType.congestion, 20, 2, district: DistrictId.seasideBoulevard),
          Mood(StakeholderGroup.businesses, -2),
        ]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.touristSeason,
      weight: (c) => _recently(c.city, DecisionId.touristSeason, 30) ? 0 : 0.8,
      options: (c, d) => const [
        DecisionOption([
          Spend(40000),
          Modify(ModifierType.demand, 1.3, 7, district: DistrictId.oldFortress),
          Modify(ModifierType.capacity, 1.2, 7, district: DistrictId.oldFortress),
          Mood(StakeholderGroup.businesses, 6),
        ]),
        DecisionOption([
          Modify(ModifierType.ticketRevenue, 1.12, 7),
          Mood(StakeholderGroup.passengers, -3),
        ]),
        DecisionOption([Modify(ModifierType.congestion, 10, 5, district: DistrictId.oldFortress)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.greenFund,
      weight: (c) => !c.city.hasChargingDepot && c.city.day > 20 ? 1 : 0,
      options: (c, d) => const [
        DecisionOption([
          LaunchProject(ProjectType.chargingDepot, null, discount: 0.4),
          Mood(StakeholderGroup.environmentalists, 8),
        ]),
        DecisionOption([Mood(StakeholderGroup.environmentalists, -5)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.flood,
      weight: (c) => 1,
      district: (c, random) => const [
        DistrictId.seasideBoulevard,
        DistrictId.oilHarbor,
        DistrictId.caspianGardens,
      ][random.nextInt(3)],
      arrival: (c, d) => [
        RoadDamage(d!, 20),
        Modify(ModifierType.congestion, 30, 3, district: d),
        Modify(ModifierType.capacity, 0.7, 3, district: d),
      ],
      options: (c, d) => [
        DecisionOption([
          const Spend(120000),
          Modify(ModifierType.congestion, -25, 3, district: d),
          Modify(ModifierType.capacity, 1.3, 3, district: d),
          const Reputation(3),
        ]),
        const DecisionOption([
          Spend(50000),
          Mood(StakeholderGroup.passengers, 6),
          Modify(ModifierType.capacity, 0.9, 2),
        ]),
        DecisionOption(const [
          Mood(StakeholderGroup.passengers, -8),
          Mood(StakeholderGroup.businesses, -6),
        ], risk: DecisionRisk(0.3, [RoadDamage(d!, 15)])),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.windStorm,
      weight: (c) => 1.2,
      arrival: (c, d) => const [
        Modify(ModifierType.capacity, 0.75, 2),
        Modify(ModifierType.capacity, 0.95, 3),
      ],
      options: (c, d) => const [
        DecisionOption([
          Modify(ModifierType.capacity, 0.4, 1),
          Modify(ModifierType.safety, 10, 2),
          Reputation(4),
          Mood(StakeholderGroup.passengers, -4),
        ]),
        DecisionOption([Spend(90000), Modify(ModifierType.capacity, 1.25, 2)]),
        DecisionOption(
          [],
          risk: DecisionRisk(0.3, [
            LoseBuses(1),
            Mood(StakeholderGroup.passengers, -8),
            Reputation(-5),
          ]),
        ),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.heatwave,
      weight: (c) => 1,
      arrival: (c, d) => const [
        Modify(ModifierType.mood, -4, 3, group: StakeholderGroup.passengers),
      ],
      options: (c, d) => [
        const DecisionOption([Spend(25000), Mood(StakeholderGroup.passengers, 5)]),
        const DecisionOption([
          Modify(ModifierType.capacity, 0.85, 3),
          Mood(StakeholderGroup.passengers, 3),
          Mood(StakeholderGroup.transportWorkers, 4),
        ]),
        DecisionOption([Mood(StakeholderGroup.passengers, c.metrics.fleetComfort < 50 ? -12 : -6)]),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.earthquake,
      weight: (c) => 0.3,
      district: (c, random) => DistrictId.values[random.nextInt(DistrictId.values.length)],
      arrival: (c, d) => [
        RoadDamage(d!, 35),
        Modify(ModifierType.congestion, 20, 5, district: d),
        Modify(ModifierType.safety, -10, 5, district: d),
      ],
      options: (c, d) => [
        DecisionOption([
          const Spend(400000),
          RoadRestore(d!),
          const Reputation(5),
          const Mood(StakeholderGroup.drivers, 5),
        ]),
        DecisionOption([LaunchProject(ProjectType.roadRepair, d)]),
        const DecisionOption([
          Mood(StakeholderGroup.drivers, -8),
          Mood(StakeholderGroup.logistics, -6),
        ], risk: DecisionRisk(0.3, [Reputation(-5)])),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.snowstorm,
      weight: (c) => 0.5,
      arrival: (c, d) => const [Modify(ModifierType.congestion, 25, 2)],
      options: (c, d) => const [
        DecisionOption([Spend(70000), Modify(ModifierType.congestion, -20, 2)]),
        DecisionOption([
          Spend(30000),
          Modify(ModifierType.capacity, 1.1, 2),
          Mood(StakeholderGroup.drivers, -8),
        ]),
        DecisionOption([
          Mood(StakeholderGroup.passengers, -5),
          Mood(StakeholderGroup.drivers, -5),
        ], risk: DecisionRisk(0.25, [Modify(ModifierType.safety, -15, 3), Reputation(-3)])),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.harborFire,
      weight: (c) => 0.6,
      district: (c, _) => DistrictId.oilHarbor,
      arrival: (c, d) => const [
        Modify(ModifierType.congestion, 20, 2, district: DistrictId.oilHarbor),
        Mood(StakeholderGroup.logistics, -5),
      ],
      options: (c, d) => const [
        DecisionOption([
          Modify(ModifierType.congestion, 30, 2, district: DistrictId.oilHarbor),
          Modify(ModifierType.safety, 15, 2, district: DistrictId.oilHarbor),
          Mood(StakeholderGroup.logistics, -10),
          Reputation(3),
        ]),
        DecisionOption([
          Spend(20000),
          Mood(StakeholderGroup.transportWorkers, 4),
          Reputation(5),
          Modify(ModifierType.capacity, 0.8, 1),
        ]),
        DecisionOption(
          [],
          risk: DecisionRisk(0.3, [
            Reputation(-8),
            Mood(StakeholderGroup.logistics, -10),
            RoadDamage(DistrictId.oilHarbor, 20),
          ]),
        ),
      ],
    ),
    DecisionTemplate(
      id: DecisionId.landslide,
      weight: (c) => 0.6,
      district: (c, _) => DistrictId.windHeights,
      arrival: (c, d) => const [
        RoadDamage(DistrictId.windHeights, 25),
        Modify(ModifierType.congestion, 30, 4, district: DistrictId.windHeights),
      ],
      options: (c, d) => const [
        DecisionOption([
          Spend(150000),
          Modify(ModifierType.congestion, -25, 4, district: DistrictId.windHeights),
          Mood(StakeholderGroup.drivers, 4),
        ]),
        DecisionOption([
          Modify(ModifierType.capacity, 0.8, 4, district: DistrictId.windHeights),
          Mood(StakeholderGroup.passengers, -3),
        ]),
        DecisionOption([Mood(StakeholderGroup.passengers, -6), Mood(StakeholderGroup.drivers, -6)]),
      ],
    ),
  ];

  static int _discounted(BusModelId model, double discount) =>
      (model.spec.price * (1 - discount)).round();

  static DistrictId? _bikeTarget(DecisionContext context) {
    final candidates = context.metrics.districts.where(
      (district) =>
          !context.city.district(district.id).hasBikeLanes &&
          (district.congestion > 55 || context.metrics.pollution > 50),
    );
    if (candidates.isEmpty) {
      return null;
    }
    return candidates.reduce((a, b) => b.congestion > a.congestion ? b : a).id;
  }

  static bool _recently(CityState city, DecisionId id, int days) =>
      city.decisionLog.any((record) => record.template == id && city.day - record.day < days);
}
