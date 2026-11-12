// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: (json['id'] as num).toInt(),
  type: $enumDecode(_$ProjectTypeEnumMap, json['type']),
  totalSeconds: (json['totalSeconds'] as num).toInt(),
  remainingSeconds: (json['remainingSeconds'] as num).toInt(),
  districtId: $enumDecodeNullable(_$DistrictIdEnumMap, json['districtId']),
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$ProjectTypeEnumMap[instance.type]!,
  'totalSeconds': instance.totalSeconds,
  'remainingSeconds': instance.remainingSeconds,
  'districtId': ?_$DistrictIdEnumMap[instance.districtId],
};

const _$ProjectTypeEnumMap = {
  ProjectType.roadRepair: 'roadRepair',
  ProjectType.roadExpansion: 'roadExpansion',
  ProjectType.bikeLanes: 'bikeLanes',
  ProjectType.smartSignals: 'smartSignals',
  ProjectType.modernStops: 'modernStops',
  ProjectType.chargingDepot: 'chargingDepot',
  ProjectType.depotExpansion: 'depotExpansion',
};

const _$DistrictIdEnumMap = {
  DistrictId.oldFortress: 'oldFortress',
  DistrictId.seasideBoulevard: 'seasideBoulevard',
  DistrictId.flameHills: 'flameHills',
  DistrictId.oilHarbor: 'oilHarbor',
  DistrictId.windHeights: 'windHeights',
  DistrictId.caspianGardens: 'caspianGardens',
};
