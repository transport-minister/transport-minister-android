import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

sealed class DecisionEffect {
  const DecisionEffect();
}

final class Spend extends DecisionEffect {
  const Spend(this.amount);

  final int amount;
}

final class Earn extends DecisionEffect {
  const Earn(this.amount);

  final int amount;
}

final class Mood extends DecisionEffect {
  const Mood(this.group, this.delta);

  final StakeholderGroup group;
  final double delta;
}

final class Reputation extends DecisionEffect {
  const Reputation(this.delta);

  final double delta;
}

final class RoadDamage extends DecisionEffect {
  const RoadDamage(this.district, this.amount);

  final DistrictId district;
  final double amount;
}

final class RoadRestore extends DecisionEffect {
  const RoadRestore(this.district);

  final DistrictId district;
}

final class Modify extends DecisionEffect {
  const Modify(this.type, this.value, this.days, {this.district, this.group});

  final ModifierType type;
  final double value;
  final int days;
  final DistrictId? district;
  final StakeholderGroup? group;
}

final class OrderBuses extends DecisionEffect {
  const OrderBuses(this.model, this.count, this.district, this.unitPrice);

  final BusModelId model;
  final int count;
  final DistrictId district;
  final int unitPrice;
}

final class LaunchProject extends DecisionEffect {
  const LaunchProject(this.type, this.district, {this.discount = 0});

  final ProjectType type;
  final DistrictId? district;
  final double discount;
}

final class LoseBuses extends DecisionEffect {
  const LoseBuses(this.count, {this.district});

  final int count;
  final DistrictId? district;
}

final class ChangeFare extends DecisionEffect {
  const ChangeFare(this.delta);

  final int delta;
}

class DecisionRisk {
  const DecisionRisk(this.chance, this.effects, {this.replacesOutcome = false});

  final double chance;
  final List<DecisionEffect> effects;
  final bool replacesOutcome;
}

class DecisionOption {
  const DecisionOption(this.effects, {this.risk});

  final List<DecisionEffect> effects;
  final DecisionRisk? risk;
}
