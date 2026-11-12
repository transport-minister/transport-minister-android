// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_decision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PendingDecision _$PendingDecisionFromJson(Map<String, dynamic> json) => _PendingDecision(
  id: (json['id'] as num).toInt(),
  template: $enumDecode(_$DecisionIdEnumMap, json['template']),
  createdTick: (json['createdTick'] as num).toInt(),
  expiresTick: (json['expiresTick'] as num).toInt(),
  district: $enumDecodeNullable(_$DistrictIdEnumMap, json['district']),
);

Map<String, dynamic> _$PendingDecisionToJson(_PendingDecision instance) => <String, dynamic>{
  'id': instance.id,
  'template': _$DecisionIdEnumMap[instance.template]!,
  'createdTick': instance.createdTick,
  'expiresTick': instance.expiresTick,
  'district': ?_$DistrictIdEnumMap[instance.district],
};

const _$DecisionIdEnumMap = {
  DecisionId.overcrowdedBuses: 'overcrowdedBuses',
  DecisionId.potholes: 'potholes',
  DecisionId.bikePetition: 'bikePetition',
  DecisionId.parkingChaos: 'parkingChaos',
  DecisionId.driverWages: 'driverWages',
  DecisionId.trafficAccident: 'trafficAccident',
  DecisionId.fuelSpike: 'fuelSpike',
  DecisionId.busDiscount: 'busDiscount',
  DecisionId.privateOperator: 'privateOperator',
  DecisionId.budgetHearing: 'budgetHearing',
  DecisionId.festival: 'festival',
  DecisionId.touristSeason: 'touristSeason',
  DecisionId.greenFund: 'greenFund',
  DecisionId.flood: 'flood',
  DecisionId.windStorm: 'windStorm',
  DecisionId.heatwave: 'heatwave',
  DecisionId.earthquake: 'earthquake',
  DecisionId.snowstorm: 'snowstorm',
  DecisionId.harborFire: 'harborFire',
  DecisionId.landslide: 'landslide',
};

const _$DistrictIdEnumMap = {
  DistrictId.oldFortress: 'oldFortress',
  DistrictId.seasideBoulevard: 'seasideBoulevard',
  DistrictId.flameHills: 'flameHills',
  DistrictId.oilHarbor: 'oilHarbor',
  DistrictId.windHeights: 'windHeights',
  DistrictId.caspianGardens: 'caspianGardens',
};

_DecisionRecord _$DecisionRecordFromJson(Map<String, dynamic> json) => _DecisionRecord(
  template: $enumDecode(_$DecisionIdEnumMap, json['template']),
  option: (json['option'] as num).toInt(),
  tick: (json['tick'] as num).toInt(),
  riskTriggered: json['riskTriggered'] as bool,
  automatic: json['automatic'] as bool,
  district: $enumDecodeNullable(_$DistrictIdEnumMap, json['district']),
);

Map<String, dynamic> _$DecisionRecordToJson(_DecisionRecord instance) => <String, dynamic>{
  'template': _$DecisionIdEnumMap[instance.template]!,
  'option': instance.option,
  'tick': instance.tick,
  'riskTriggered': instance.riskTriggered,
  'automatic': instance.automatic,
  'district': ?_$DistrictIdEnumMap[instance.district],
};
