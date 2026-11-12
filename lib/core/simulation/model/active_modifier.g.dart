// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActiveModifier _$ActiveModifierFromJson(Map<String, dynamic> json) => _ActiveModifier(
  type: $enumDecode(_$ModifierTypeEnumMap, json['type']),
  value: (json['value'] as num).toDouble(),
  remainingDays: (json['remainingDays'] as num).toInt(),
  district: $enumDecodeNullable(_$DistrictIdEnumMap, json['district']),
  group: $enumDecodeNullable(_$StakeholderGroupEnumMap, json['group']),
);

Map<String, dynamic> _$ActiveModifierToJson(_ActiveModifier instance) => <String, dynamic>{
  'type': _$ModifierTypeEnumMap[instance.type]!,
  'value': instance.value,
  'remainingDays': instance.remainingDays,
  'district': ?_$DistrictIdEnumMap[instance.district],
  'group': ?_$StakeholderGroupEnumMap[instance.group],
};

const _$ModifierTypeEnumMap = {
  ModifierType.capacity: 'capacity',
  ModifierType.demand: 'demand',
  ModifierType.congestion: 'congestion',
  ModifierType.safety: 'safety',
  ModifierType.energyCost: 'energyCost',
  ModifierType.salaryCost: 'salaryCost',
  ModifierType.maintenanceCost: 'maintenanceCost',
  ModifierType.ticketRevenue: 'ticketRevenue',
  ModifierType.subsidy: 'subsidy',
  ModifierType.dailyCost: 'dailyCost',
  ModifierType.dailyIncome: 'dailyIncome',
  ModifierType.mood: 'mood',
};

const _$DistrictIdEnumMap = {
  DistrictId.oldFortress: 'oldFortress',
  DistrictId.seasideBoulevard: 'seasideBoulevard',
  DistrictId.flameHills: 'flameHills',
  DistrictId.oilHarbor: 'oilHarbor',
  DistrictId.windHeights: 'windHeights',
  DistrictId.caspianGardens: 'caspianGardens',
};

const _$StakeholderGroupEnumMap = {
  StakeholderGroup.passengers: 'passengers',
  StakeholderGroup.drivers: 'drivers',
  StakeholderGroup.pedestrians: 'pedestrians',
  StakeholderGroup.cyclists: 'cyclists',
  StakeholderGroup.businesses: 'businesses',
  StakeholderGroup.transportWorkers: 'transportWorkers',
  StakeholderGroup.environmentalists: 'environmentalists',
  StakeholderGroup.logistics: 'logistics',
};
