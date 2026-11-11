// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulation_clock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeAnchor _$TimeAnchorFromJson(Map<String, dynamic> json) => _TimeAnchor(
  syncedAtMs: (json['syncedAtMs'] as num).toInt(),
  carriedMs: (json['carriedMs'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TimeAnchorToJson(_TimeAnchor instance) => <String, dynamic>{
  'syncedAtMs': instance.syncedAtMs,
  'carriedMs': instance.carriedMs,
};
