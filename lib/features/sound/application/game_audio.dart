import 'dart:async';

import 'package:transport_minister/features/sound/domain/game_sound.dart';
import 'package:transport_minister/features/sound/domain/sound_output.dart';
import 'package:transport_minister/features/sound/domain/sound_settings.dart';

class GameAudio {
  GameAudio(this._output);

  final SoundOutput _output;
  final _playing = <GameLoop>{};
  SoundSettings? _settings;
  var _foreground = true;
  var _inCity = false;

  void apply(SoundSettings settings) {
    _settings = settings;
    _sync();
  }

  void enterCity() {
    _inCity = true;
    _sync();
  }

  void leaveCity() {
    _inCity = false;
    _sync();
  }

  void toForeground() {
    _foreground = true;
    _sync();
  }

  void toBackground() {
    _foreground = false;
    _sync();
  }

  void play(GameSound sound) {
    final volume = _volumeOf(sound.group);
    if (volume > 0 && (sound.group != SoundGroup.city || _inCity)) {
      unawaited(_output.play(sound, volume));
    }
  }

  double _volumeOf(SoundGroup group) {
    final settings = _settings;
    return settings == null || !_foreground ? 0 : settings.of(group).output;
  }

  bool _wants(GameLoop loop) =>
      _volumeOf(loop.group) > 0 && (loop != GameLoop.cityAmbience || _inCity);

  void _sync() {
    for (final loop in GameLoop.values) {
      final volume = _volumeOf(loop.group);
      if (!_wants(loop)) {
        if (_playing.remove(loop)) {
          unawaited(_output.pauseLoop(loop));
        }
      } else if (_playing.add(loop)) {
        unawaited(_output.startLoop(loop, volume));
      } else {
        unawaited(_output.setLoopVolume(loop, volume));
      }
    }
  }
}
