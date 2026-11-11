import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';

class CityDevelopment {
  const CityDevelopment();

  (CityState, List<CityEvent>) award(CityState state, int points) {
    if (points <= 0) {
      return (state, const []);
    }
    final before = CityLevels.levelFor(state.developmentPoints);
    final total = state.developmentPoints + points;
    final after = CityLevels.levelFor(total);
    var next = state.copyWith(developmentPoints: total);
    final events = <CityEvent>[];
    for (var level = before + 1; level <= after; level++) {
      final reward = CityLevels.rewardFor(level);
      next = next.copyWith(
        budget: next.budget + reward,
        pendingLedger: {
          ...next.pendingLedger,
          LedgerItem.levelRewards: (next.pendingLedger[LedgerItem.levelRewards] ?? 0) + reward,
        },
      );
      events.add(CityLeveledUp(level, reward));
    }
    return (next, events);
  }
}
