// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistrictState _$DistrictStateFromJson(Map<String, dynamic> json) => _DistrictState(
  id: $enumDecode(_$DistrictIdEnumMap, json['id']),
  population: (json['population'] as num).toDouble(),
  roadCondition: (json['roadCondition'] as num).toDouble(),
  roadLevel: (json['roadLevel'] as num).toInt(),
  hasBikeLanes: json['hasBikeLanes'] as bool? ?? false,
  bikeAdoption: (json['bikeAdoption'] as num?)?.toDouble() ?? 0,
  hasSmartSignals: json['hasSmartSignals'] as bool? ?? false,
  hasModernStops: json['hasModernStops'] as bool? ?? false,
  hasPark: json['hasPark'] as bool? ?? false,
  hasParkAndRide: json['hasParkAndRide'] as bool? ?? false,
);

Map<String, dynamic> _$DistrictStateToJson(_DistrictState instance) => <String, dynamic>{
  'id': _$DistrictIdEnumMap[instance.id]!,
  'population': instance.population,
  'roadCondition': instance.roadCondition,
  'roadLevel': instance.roadLevel,
  'hasBikeLanes': instance.hasBikeLanes,
  'bikeAdoption': instance.bikeAdoption,
  'hasSmartSignals': instance.hasSmartSignals,
  'hasModernStops': instance.hasModernStops,
  'hasPark': instance.hasPark,
  'hasParkAndRide': instance.hasParkAndRide,
};

const _$DistrictIdEnumMap = {
  DistrictId.oldFortress: 'oldFortress',
  DistrictId.seasideBoulevard: 'seasideBoulevard',
  DistrictId.flameHills: 'flameHills',
  DistrictId.oilHarbor: 'oilHarbor',
  DistrictId.windHeights: 'windHeights',
  DistrictId.caspianGardens: 'caspianGardens',
};
