import 'package:transport_minister/features/sound/domain/game_sound.dart';
import 'package:transport_minister/features/sound/domain/sound_output.dart';

class FakeSoundOutput implements SoundOutput {
  final played = <(GameSound, double)>[];
  final loops = <GameLoop, double>{};

  @override
  Future<void> play(GameSound sound, double volume) async => played.add((sound, volume));

  @override
  Future<void> startLoop(GameLoop loop, double volume) async => loops[loop] = volume;

  @override
  Future<void> setLoopVolume(GameLoop loop, double volume) async {
    if (loops.containsKey(loop)) {
      loops[loop] = volume;
    }
  }

  @override
  Future<void> pauseLoop(GameLoop loop) async => loops.remove(loop);

  @override
  Future<void> dispose() async {}
}
