import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

enum RejectionReason {
  insufficientFunds,
  depotFull,
  maxLevelReached,
  projectLimitReached,
  alreadyInProgress,
  alreadyBuilt,
  requiresChargingDepot,
  invalidTarget,
  loanActive,
  fareOutOfRange,
}

sealed class CommandOutcome {
  const CommandOutcome();
}

final class CommandApplied extends CommandOutcome {
  const CommandApplied(this.state, {this.events = const []});

  final CityState state;
  final List<CityEvent> events;
}

final class CommandRejected extends CommandOutcome {
  const CommandRejected(this.reason);

  final RejectionReason reason;
}
