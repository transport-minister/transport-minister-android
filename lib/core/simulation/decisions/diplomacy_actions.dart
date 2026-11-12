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
      diplomacy: 8,
      xp: 15,
      cooldown: 180,
      effects: [
        Spend(120000),
        Mood(StakeholderGroup.passengers, 6),
        Modify(ModifierType.mood, 6, 300, group: StakeholderGroup.passengers),
        Modify(ModifierType.demand, 1.1, 300),
      ],
    ),
    DiplomacyActionId.hackathon => const DiplomacyAction(
      diplomacy: 10,
      xp: 20,
      cooldown: 180,
      effects: [
        Spend(150000),
        Mood(StakeholderGroup.businesses, 4),
        Modify(ModifierType.ticketRevenue, 1.1, 300),
      ],
    ),
    DiplomacyActionId.driverRaise => const DiplomacyAction(
      diplomacy: 10,
      xp: 15,
      cooldown: 240,
      effects: [
        Spend(180000),
        Mood(StakeholderGroup.transportWorkers, 10),
        Modify(ModifierType.mood, 10, 600, group: StakeholderGroup.transportWorkers),
        Modify(ModifierType.salaryCost, 1.2, 600),
      ],
    ),
    DiplomacyActionId.shopTaxBreak => const DiplomacyAction(
      diplomacy: 12,
      xp: 20,
      cooldown: 240,
      effects: [
        Spend(250000),
        Mood(StakeholderGroup.businesses, 6),
        Modify(ModifierType.mood, 6, 600, group: StakeholderGroup.businesses),
        Modify(ModifierType.mood, 4, 600, group: StakeholderGroup.logistics),
      ],
    ),
    DiplomacyActionId.cleanAir => const DiplomacyAction(
      diplomacy: 15,
      xp: 25,
      cooldown: 300,
      effects: [
        Spend(300000),
        Mood(StakeholderGroup.environmentalists, 8),
        Modify(ModifierType.mood, 6, 600, group: StakeholderGroup.pedestrians),
        Modify(ModifierType.mood, 8, 600, group: StakeholderGroup.environmentalists),
      ],
    ),
    DiplomacyActionId.cityFestival => const DiplomacyAction(
      diplomacy: 25,
      xp: 50,
      cooldown: 480,
      effects: [
        Spend(600000),
        Mood(StakeholderGroup.passengers, 5),
        Mood(StakeholderGroup.drivers, 5),
        Mood(StakeholderGroup.pedestrians, 5),
        Mood(StakeholderGroup.businesses, 5),
        Reputation(2),
        Modify(ModifierType.congestion, 10, 120),
      ],
    ),
  };
}
