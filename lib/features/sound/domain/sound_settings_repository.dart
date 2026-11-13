import 'package:transport_minister/features/sound/domain/sound_settings.dart';

abstract interface class SoundSettingsRepository {
  Future<SoundSettings?> load();

  Future<void> save(SoundSettings settings);
}
