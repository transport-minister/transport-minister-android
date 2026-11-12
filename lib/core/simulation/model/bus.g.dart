// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bus _$BusFromJson(Map<String, dynamic> json) => _Bus(
  id: (json['id'] as num).toInt(),
  model: $enumDecode(_$BusModelIdEnumMap, json['model']),
  districtId: $enumDecode(_$DistrictIdEnumMap, json['districtId']),
  level: (json['level'] as num?)?.toInt() ?? 1,
  ageSeconds: (json['ageSeconds'] as num?)?.toInt() ?? 0,
  deliveryTick: (json['deliveryTick'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BusToJson(_Bus instance) => <String, dynamic>{
  'id': instance.id,
  'model': _$BusModelIdEnumMap[instance.model]!,
  'districtId': _$DistrictIdEnumMap[instance.districtId]!,
  'level': instance.level,
  'ageSeconds': instance.ageSeconds,
  'deliveryTick': instance.deliveryTick,
};

const _$BusModelIdEnumMap = {
  BusModelId.veteran: 'veteran',
  BusModelId.hopMini: 'hopMini',
  BusModelId.cityRunner: 'cityRunner',
  BusModelId.megaLink: 'megaLink',
  BusModelId.voltaE: 'voltaE',
};

const _$DistrictIdEnumMap = {
  DistrictId.oldFortress: 'oldFortress',
  DistrictId.seasideBoulevard: 'seasideBoulevard',
  DistrictId.flameHills: 'flameHills',
  DistrictId.oilHarbor: 'oilHarbor',
  DistrictId.windHeights: 'windHeights',
  DistrictId.caspianGardens: 'caspianGardens',
};
