import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';

part 'sound_settings.freezed.dart';
part 'sound_settings.g.dart';

@freezed
abstract class SoundLevel with _$SoundLevel {
  const factory SoundLevel({@Default(true) bool enabled, required double volume}) = _SoundLevel;

  const SoundLevel._();

  factory SoundLevel.fromJson(Map<String, dynamic> json) => _$SoundLevelFromJson(json);

  double get output => enabled ? volume : 0;
}

@freezed
abstract class SoundSettings with _$SoundSettings {
  const factory SoundSettings({
    @Default(SoundLevel(volume: 0.5)) SoundLevel music,
    @Default(SoundLevel(volume: 0.7)) SoundLevel effects,
    @Default(SoundLevel(volume: 0.5)) SoundLevel city,
  }) = _SoundSettings;

  const SoundSettings._();

  factory SoundSettings.fromJson(Map<String, dynamic> json) => _$SoundSettingsFromJson(json);

  SoundLevel of(SoundGroup group) => switch (group) {
    SoundGroup.music => music,
    SoundGroup.effects => effects,
    SoundGroup.city => city,
  };

  SoundSettings change(SoundGroup group, SoundLevel level) => switch (group) {
    SoundGroup.music => copyWith(music: level),
    SoundGroup.effects => copyWith(effects: level),
    SoundGroup.city => copyWith(city: level),
  };
}
