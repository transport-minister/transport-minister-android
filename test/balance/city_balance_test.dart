import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';

import 'balance_bots.dart';
import 'campaign.dart';

void main() {
  const minutes = 300;

  test('a minister who does nothing loses Baku to gridlock', () {
    for (final seed in const [1, 2]) {
      final run = runCampaign(const IdleBot(), seed: seed, minutes: minutes);

      expect(run.dismissedSecond, lessThan(65 * 60), reason: 'seed $seed');
      expect(run.dismissalCause, CrisisCause.gridlock, reason: 'seed $seed');
      expect(run.completedSecond, isNull, reason: 'seed $seed');
    }
  });

  test('buying buses alone is not a strategy', () {
    final run = runCampaign(const BusOnlyBot(), seed: 1, minutes: minutes);

    expect(run.dismissedSecond, lessThan(130 * 60));
    expect(run.dismissalCause, CrisisCause.gridlock);
    expect(run.completedSecond, isNull);
  });

  test('a planning minister completes Baku in about two hours without a warning', () {
    for (final seed in const [1, 2, 3]) {
      final run = runCampaign(const PlannerBot(), seed: seed, minutes: minutes);

      expect(run.completedSecond, inInclusiveRange(80 * 60, 160 * 60), reason: 'seed $seed');
      expect(run.firstWarningSecond, isNull, reason: 'seed $seed');
      expect(run.firstPurchaseSecond, lessThanOrEqualTo(90), reason: 'seed $seed');
      expect(run.busyTurns, greaterThan(run.turns * 0.4), reason: 'seed $seed');
      expect(run.lowestBudget, greaterThanOrEqualTo(0), reason: 'seed $seed');
      expect(run.growth, inInclusiveRange(0.1, 0.35), reason: 'seed $seed');
    }
  });

  test('a casual minister who checks in every minute and a half still makes it', () {
    final run = runCampaign(const CasualBot(), seed: 4, minutes: minutes);

    expect(run.dismissedSecond, isNull);
    expect(run.completedSecond, lessThan(180 * 60));
  });
}
