import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';
import 'package:transport_minister/features/sound/domain/sound_output.dart';

class AudioplayersSoundOutput implements SoundOutput {
  AudioplayersSoundOutput();

  static const _tapVariants = ['sounds/tap_1.ogg', 'sounds/tap_2.ogg', 'sounds/tap_3.ogg'];
  static const _tapPlayers = 3;

  final _context = AudioContextConfig(focus: AudioContextConfigFocus.mixWithOthers).build();
  final _taps = <String, Future<AudioPool>>{};
  final _effects = <GameSound, Future<AudioPlayer>>{};
  final _loops = <GameLoop, Future<AudioPlayer>>{};
  var _nextTap = 0;

  @override
  Future<void> play(GameSound sound, double volume) => _safely(() async {
    if (sound == GameSound.tap) {
      final path = _tapVariants[_nextTap++ % _tapVariants.length];
      final pool = await (_taps[path] ??= AudioPool.create(
        source: AssetSource(path),
        maxPlayers: _tapPlayers,
        playerMode: PlayerMode.lowLatency,
        audioContext: _context,
      ));
      await pool.start(volume: volume);
      return;
    }
    final player = await (_effects[sound] ??= _player(ReleaseMode.stop));
    await player.play(AssetSource(_effectPath(sound)), volume: volume);
  });

  @override
  Future<void> startLoop(GameLoop loop, double volume) => _safely(() async {
    final player = await (_loops[loop] ??= _loopPlayer(loop));
    await player.setVolume(volume);
    await player.resume();
  });

  @override
  Future<void> setLoopVolume(GameLoop loop, double volume) => _safely(() async {
    await (await _loops[loop])?.setVolume(volume);
  });

  @override
  Future<void> pauseLoop(GameLoop loop) => _safely(() async {
    await (await _loops[loop])?.pause();
  });

  @override
  Future<void> dispose() => _safely(() async {
    for (final pool in _taps.values) {
      await (await pool).dispose();
    }
    for (final player in [..._effects.values, ..._loops.values]) {
      await (await player).dispose();
    }
  });

  Future<AudioPlayer> _player(ReleaseMode mode) async {
    final player = AudioPlayer();
    await player.setAudioContext(_context);
    await player.setReleaseMode(mode);
    return player;
  }

  Future<AudioPlayer> _loopPlayer(GameLoop loop) async {
    final player = await _player(ReleaseMode.loop);
    await player.setSource(AssetSource(_loopPath(loop)));
    return player;
  }

  String _effectPath(GameSound sound) => switch (sound) {
    GameSound.tap => _tapVariants[1],
    GameSound.busHorn => 'sounds/bus_horn.ogg',
    GameSound.busPass => 'sounds/bus_pass.ogg',
    GameSound.busDoors => 'sounds/bus_doors.ogg',
    GameSound.metroTrain => 'sounds/metro_train.ogg',
  };

  String _loopPath(GameLoop loop) => switch (loop) {
    GameLoop.music => 'sounds/relaxing_music.ogg',
    GameLoop.cityAmbience => 'sounds/city_ambience.ogg',
  };

  Future<void> _safely(Future<void> Function() action) async {
    try {
      await action();
    } on Exception catch (error) {
      debugPrint('Sound unavailable: $error');
    }
  }
}
