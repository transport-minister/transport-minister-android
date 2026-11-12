import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/diplomacy_rules.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_desk.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/pending_decision.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  const commands = CityCommands();

  group('technology', () {
    test('new bus models need a signed contract', () {
      final city = newBaku();

      expect(
        rejected(
          commands.buyBus(city, model: BusModelId.hopMini, district: DistrictId.oldFortress),
        ),
        RejectionReason.locked,
      );
      expect(
        applied(
          commands.buyBus(
            city.copyWith(technologies: {TechnologyId.minibusContract}),
            model: BusModelId.hopMini,
            district: DistrictId.oldFortress,
          ),
        ).fleet,
        hasLength(city.fleet.length + 1),
      );
    });

    test('unlocking costs money and diplomacy and follows the tree', () {
      final city = newBaku();
      final rich = city.copyWith(diplomacyPoints: 30);

      expect(
        rejected(commands.unlockTechnology(rich, TechnologyId.articulatedContract)),
        RejectionReason.locked,
      );
      expect(
        rejected(commands.unlockTechnology(city, TechnologyId.minibusContract)),
        RejectionReason.insufficientDiplomacy,
      );

      final unlocked = applied(commands.unlockTechnology(rich, TechnologyId.minibusContract));

      expect(unlocked.technologies, {TechnologyId.minibusContract});
      expect(unlocked.budget, rich.budget - TechnologyId.minibusContract.money);
      expect(unlocked.diplomacyPoints, 30 - TechnologyId.minibusContract.diplomacy);
      expect(unlocked.pendingLedger[LedgerItem.technology], -TechnologyId.minibusContract.money);
      expect(
        rejected(commands.unlockTechnology(unlocked, TechnologyId.minibusContract)),
        RejectionReason.alreadyUnlocked,
      );
    });

    test('bus upgrade levels need their technology', () {
      final city = newBaku();
      final busId = city.fleet.first.id;

      expect(rejected(commands.upgradeBus(city, busId)), RejectionReason.locked);
      expect(
        applied(
          commands.upgradeBus(city.copyWith(technologies: {TechnologyId.engineTuning}), busId),
        ).fleet.first.level,
        2,
      );
    });

    test('operations technologies give permanent perks', () {
      final city = newBaku().copyWith(diplomacyPoints: 20);
      final smart = applied(commands.unlockTechnology(city, TechnologyId.smartTicketing));
      int tickets(CityState state) => const EconomyCalculator().operatingLedger(
        state,
        const MetricsCalculator().calculate(state),
      )[LedgerItem.tickets]!;

      expect(tickets(smart), (tickets(city) * 1.08).round());
      expect(runSeconds(smart, 40).state.modifiers, isNotEmpty);
    });
  });

  group('diplomacy', () {
    test('happier cities earn more points every minute', () {
      expect(DiplomacyRules.perMinute(38), 0);
      expect(DiplomacyRules.perMinute(55), 2);
      expect(DiplomacyRules.perMinute(70), 4);
      expect(DiplomacyRules.perMinute(85), 6);
    });

    test('decisions that please people earn diplomacy', () {
      expect(
        DiplomacyRules.forChoice(const [Mood(StakeholderGroup.passengers, 8), Reputation(2)]),
        7,
      );
      expect(DiplomacyRules.forChoice(const [Mood(StakeholderGroup.drivers, -6)]), 0);
      expect(DiplomacyRules.forChoice(const [Spend(1000)]), 0);
    });

    test('choosing a kind answer adds diplomacy points', () {
      final city = newBaku().copyWith(
        decisions: const [
          PendingDecision(
            id: 900,
            template: DecisionId.driverWages,
            createdTick: 1,
            expiresTick: 4,
          ),
        ],
      );

      final outcome = const DecisionDesk().choose(city, 900, 1);

      expect(applied(outcome).diplomacyPoints, 4);
      expect((outcome as CommandApplied).events.whereType<DiplomacyEarned>().single.amount, 4);
    });
  });
}
