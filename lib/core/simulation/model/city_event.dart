import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';

sealed class CityEvent {
  const CityEvent();
}

final class BusPurchased extends CityEvent {
  const BusPurchased(this.model, this.district);

  final BusModelId model;
  final DistrictId district;
}

final class BusUpgraded extends CityEvent {
  const BusUpgraded(this.model, this.level);

  final BusModelId model;
  final int level;
}

final class BusesDelivered extends CityEvent {
  const BusesDelivered(this.count);

  final int count;
}

final class ProjectStarted extends CityEvent {
  const ProjectStarted(this.type, this.district);

  final ProjectType type;
  final DistrictId? district;
}

final class ProjectCompleted extends CityEvent {
  const ProjectCompleted(this.type, this.district);

  final ProjectType type;
  final DistrictId? district;
}

final class BudgetAllocated extends CityEvent {
  const BudgetAllocated(this.amount);

  final int amount;
}

final class LoanRepaid extends CityEvent {
  const LoanRepaid();
}

final class CrisisWarning extends CityEvent {
  const CrisisWarning(this.level);

  final int level;
}

final class MinisterDismissed extends CityEvent {
  const MinisterDismissed();
}

final class CityLeveledUp extends CityEvent {
  const CityLeveledUp(this.level, this.reward);

  final int level;
  final int reward;
}

final class DayClosed extends CityEvent {
  const DayClosed(this.day, this.satisfaction);

  final int day;
  final double satisfaction;
}

final class CrisisAverted extends CityEvent {
  const CrisisAverted();
}

final class DecisionArrived extends CityEvent {
  const DecisionArrived(this.decision, this.district);

  final DecisionId decision;
  final DistrictId? district;
}

final class DecisionResolved extends CityEvent {
  const DecisionResolved(this.decision, {required this.riskTriggered, required this.automatic});

  final DecisionId decision;
  final bool riskTriggered;
  final bool automatic;
}

final class ReputationShift extends CityEvent {
  const ReputationShift(this.delta);

  final double delta;
}
