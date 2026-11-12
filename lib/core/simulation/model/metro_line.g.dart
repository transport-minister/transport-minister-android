// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metro_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetroLine _$MetroLineFromJson(Map<String, dynamic> json) => _MetroLine(
  from: $enumDecode(_$DistrictIdEnumMap, json['from']),
  to: $enumDecode(_$DistrictIdEnumMap, json['to']),
  totalSeconds: (json['totalSeconds'] as num).toInt(),
  remainingSeconds: (json['remainingSeconds'] as num).toInt(),
);

Map<String, dynamic> _$MetroLineToJson(_MetroLine instance) => <String, dynamic>{
  'from': _$DistrictIdEnumMap[instance.from]!,
  'to': _$DistrictIdEnumMap[instance.to]!,
  'totalSeconds': instance.totalSeconds,
  'remainingSeconds': instance.remainingSeconds,
};

const _$DistrictIdEnumMap = {
  DistrictId.oldFortress: 'oldFortress',
  DistrictId.seasideBoulevard: 'seasideBoulevard',
  DistrictId.flameHills: 'flameHills',
  DistrictId.oilHarbor: 'oilHarbor',
  DistrictId.windHeights: 'windHeights',
  DistrictId.caspianGardens: 'caspianGardens',
};
