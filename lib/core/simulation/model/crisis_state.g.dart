// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crisis_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CrisisState _$CrisisStateFromJson(Map<String, dynamic> json) => _CrisisState(
  days: (json['days'] as num?)?.toInt() ?? 0,
  warnings: (json['warnings'] as num?)?.toInt() ?? 0,
  dismissed: json['dismissed'] as bool? ?? false,
);

Map<String, dynamic> _$CrisisStateToJson(_CrisisState instance) => <String, dynamic>{
  'days': instance.days,
  'warnings': instance.warnings,
  'dismissed': instance.dismissed,
};
