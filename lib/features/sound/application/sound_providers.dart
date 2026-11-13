import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/sound/application/game_audio.dart';
import 'package:transport_minister/features/sound/data/audioplayers_sound_output.dart';
import 'package:transport_minister/features/sound/data/local_sound_settings_repository.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';
import 'package:transport_minister/features/sound/domain/sound_output.dart';
import 'package:transport_minister/features/sound/domain/sound_settings.dart';
import 'package:transport_minister/features/sound/domain/sound_settings_repository.dart';

final soundOutputProvider = Provider<SoundOutput>((ref) {
  final output = AudioplayersSoundOutput();
  ref.onDispose(output.dispose);
  return output;
});

final soundSettingsRepositoryProvider = Provider<SoundSettingsRepository>(
  (ref) => LocalSoundSettingsRepository(ref.watch(documentStoreProvider)),
);

final soundSettingsProvider = AsyncNotifierProvider<SoundSettingsController, SoundSettings>(
  SoundSettingsController.new,
);

final gameAudioProvider = Provider<GameAudio>((ref) {
  final audio = GameAudio(ref.watch(soundOutputProvider));
  ref.listen(soundSettingsProvider, (previous, next) {
    final settings = next.value;
    if (settings != null) {
      audio.apply(settings);
    }
  }, fireImmediately: true);
  return audio;
});

class SoundSettingsController extends AsyncNotifier<SoundSettings> {
  @override
  Future<SoundSettings> build() async =>
      await ref.read(soundSettingsRepositoryProvider).load() ?? const SoundSettings();

  void preview(SoundGroup group, SoundLevel level) {
    final settings = state.value;
    if (settings != null) {
      state = AsyncData(settings.change(group, level));
    }
  }

  Future<void> change(SoundGroup group, SoundLevel level) async {
    final settings = state.value;
    if (settings == null) {
      return;
    }
    final next = settings.change(group, level);
    state = AsyncData(next);
    await ref.read(soundSettingsRepositoryProvider).save(next);
  }
}
