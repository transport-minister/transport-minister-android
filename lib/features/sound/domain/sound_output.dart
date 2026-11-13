import 'package:transport_minister/features/sound/domain/game_sound.dart';

abstract interface class SoundOutput {
  Future<void> play(GameSound sound, double volume);

  Future<void> startLoop(GameLoop loop, double volume);

  Future<void> setLoopVolume(GameLoop loop, double volume);

  Future<void> pauseLoop(GameLoop loop);

  Future<void> dispose();
}
