import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';

import 'balance_bots.dart';
import 'campaign.dart';

void main() {
  const days = 600;

  test('a minister who does nothing loses Baku to gridlock', () {
    for (final seed in const [1, 2]) {
      final run = runCampaign(const IdleBot(), seed: seed, days: days);

      expect(run.dismissedDay, lessThan(130), reason: 'seed $seed');
      expect(run.dismissalCause, CrisisCause.gridlock, reason: 'seed $seed');
      expect(run.completedDay, isNull, reason: 'seed $seed');
    }
  });

  test('buying buses alone is not a strategy', () {
    final run = runCampaign(const BusOnlyBot(), seed: 1, days: days);

    expect(run.dismissedDay, lessThan(260));
    expect(run.dismissalCause, CrisisCause.gridlock);
    expect(run.completedDay, isNull);
  });

  test('a planning minister completes Baku in a few hours without a warning', () {
    for (final seed in const [1, 2, 3]) {
      final run = runCampaign(const PlannerBot(), seed: seed, days: days);

      expect(run.completedDay, inInclusiveRange(180, 320), reason: 'seed $seed');
      expect(run.firstWarningDay, isNull, reason: 'seed $seed');
      expect(run.firstPurchaseDay, lessThanOrEqualTo(3), reason: 'seed $seed');
      expect(run.busyDays, greaterThan(run.daysPlayed * 0.4), reason: 'seed $seed');
      expect(run.lowestBudget, greaterThanOrEqualTo(0), reason: 'seed $seed');
      expect(run.growth, inInclusiveRange(0.1, 0.35), reason: 'seed $seed');
    }
  });

  test('a casual minister who plays every few days still makes it', () {
    final run = runCampaign(const CasualBot(), seed: 4, days: days);

    expect(run.dismissedDay, isNull);
    expect(run.completedDay, lessThan(360));
  });
}
