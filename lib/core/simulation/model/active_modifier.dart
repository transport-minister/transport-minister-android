import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

part 'active_modifier.freezed.dart';
part 'active_modifier.g.dart';

enum ModifierType {
  capacity,
  demand,
  congestion,
  safety,
  energyCost,
  salaryCost,
  maintenanceCost,
  ticketRevenue,
  subsidy,
  extraCost,
  extraIncome,
  mood;

  bool get isMultiplier => switch (this) {
    capacity ||
    demand ||
    energyCost ||
    salaryCost ||
    maintenanceCost ||
    ticketRevenue ||
    subsidy => true,
    congestion || safety || extraCost || extraIncome || mood => false,
  };
}

@freezed
abstract class ActiveModifier with _$ActiveModifier {
  const factory ActiveModifier({
    required ModifierType type,
    required double value,
    required int remainingSeconds,
    DistrictId? district,
    StakeholderGroup? group,
  }) = _ActiveModifier;

  const ActiveModifier._();

  factory ActiveModifier.fromJson(Map<String, dynamic> json) => _$ActiveModifierFromJson(json);

  static const permanent = -1;

  bool get isPermanent => remainingSeconds == permanent;
}
