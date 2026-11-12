import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

enum DiplomacyActionId {
  cheaperTickets,
  hackathon,
  driverRaise,
  shopTaxBreak,
  cleanAir,
  cityFestival,
}

class DiplomacyAction {
  const DiplomacyAction({
    required this.diplomacy,
    required this.xp,
    required this.cooldown,
    required this.effects,
  });

  final int diplomacy;
  final int xp;
  final int cooldown;
  final List<DecisionEffect> effects;
}

extension DiplomacyActions on DiplomacyActionId {
  DiplomacyAction get spec => switch (this) {
    DiplomacyActionId.cheaperTickets => const DiplomacyAction(
      diplomacy: 5,
      xp: 15,
      cooldown: 180,
      effects: [
        Spend(120000),
        Mood(StakeholderGroup.passengers, 8),
        Modify(ModifierType.demand, 1.1, 240),
      ],
    ),
    DiplomacyActionId.hackathon => const DiplomacyAction(
      diplomacy: 6,
      xp: 20,
      cooldown: 180,
      effects: [
        Spend(150000),
        Mood(StakeholderGroup.businesses, 4),
        Modify(ModifierType.ticketRevenue, 1.1, 300),
      ],
    ),
    DiplomacyActionId.driverRaise => const DiplomacyAction(
      diplomacy: 6,
      xp: 15,
      cooldown: 240,
      effects: [
        Spend(180000),
        Mood(StakeholderGroup.transportWorkers, 12),
        Modify(ModifierType.salaryCost, 1.2, 300),
      ],
    ),
    DiplomacyActionId.shopTaxBreak => const DiplomacyAction(
      diplomacy: 8,
      xp: 20,
      cooldown: 240,
      effects: [
        Spend(250000),
        Mood(StakeholderGroup.businesses, 8),
        Mood(StakeholderGroup.logistics, 5),
      ],
    ),
    DiplomacyActionId.cleanAir => const DiplomacyAction(
      diplomacy: 10,
      xp: 25,
      cooldown: 300,
      effects: [
        Spend(300000),
        Mood(StakeholderGroup.environmentalists, 10),
        Mood(StakeholderGroup.pedestrians, 5),
        Mood(StakeholderGroup.cyclists, 5),
      ],
    ),
    DiplomacyActionId.cityFestival => const DiplomacyAction(
      diplomacy: 18,
      xp: 50,
      cooldown: 480,
      effects: [
        Spend(600000),
        Mood(StakeholderGroup.passengers, 4),
        Mood(StakeholderGroup.drivers, 4),
        Mood(StakeholderGroup.pedestrians, 4),
        Mood(StakeholderGroup.businesses, 4),
        Reputation(2),
        Modify(ModifierType.congestion, 10, 120),
      ],
    ),
  };
}
