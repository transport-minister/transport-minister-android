// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minister_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MinisterProfile _$MinisterProfileFromJson(Map<String, dynamic> json) => _MinisterProfile(
  bestCityLevels:
      (json['bestCityLevels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$CityIdEnumMap, k), (e as num).toInt()),
      ) ??
      const {},
);

Map<String, dynamic> _$MinisterProfileToJson(_MinisterProfile instance) => <String, dynamic>{
  'bestCityLevels': instance.bestCityLevels.map((k, e) => MapEntry(_$CityIdEnumMap[k]!, e)),
};

const _$CityIdEnumMap = {
  CityId.baku: 'baku',
  CityId.istanbul: 'istanbul',
  CityId.london: 'london',
  CityId.tokyo: 'tokyo',
  CityId.newYork: 'newYork',
};
