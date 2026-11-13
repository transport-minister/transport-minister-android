// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SoundLevel _$SoundLevelFromJson(Map<String, dynamic> json) => _SoundLevel(
  enabled: json['enabled'] as bool? ?? true,
  volume: (json['volume'] as num).toDouble(),
);

Map<String, dynamic> _$SoundLevelToJson(_SoundLevel instance) => <String, dynamic>{
  'enabled': instance.enabled,
  'volume': instance.volume,
};

_SoundSettings _$SoundSettingsFromJson(Map<String, dynamic> json) => _SoundSettings(
  music: json['music'] == null
      ? const SoundLevel(volume: 0.5)
      : SoundLevel.fromJson(json['music'] as Map<String, dynamic>),
  effects: json['effects'] == null
      ? const SoundLevel(volume: 0.7)
      : SoundLevel.fromJson(json['effects'] as Map<String, dynamic>),
  city: json['city'] == null
      ? const SoundLevel(volume: 0.5)
      : SoundLevel.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SoundSettingsToJson(_SoundSettings instance) => <String, dynamic>{
  'music': instance.music.toJson(),
  'effects': instance.effects.toJson(),
  'city': instance.city.toJson(),
};
