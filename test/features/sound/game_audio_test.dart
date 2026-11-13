import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/features/sound/application/game_audio.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';
import 'package:transport_minister/features/sound/domain/sound_settings.dart';

import '../../helpers/fake_sound_output.dart';

void main() {
  late FakeSoundOutput output;
  late GameAudio audio;

  setUp(() {
    output = FakeSoundOutput();
    audio = GameAudio(output);
  });

  test('nothing plays until the saved settings arrive, then the music loops', () {
    audio.play(GameSound.tap);

    expect(output.loops, isEmpty);
    expect(output.played, isEmpty);

    audio.apply(const SoundSettings());

    expect(output.loops, {GameLoop.music: 0.5});
  });

  test('the city ambience plays only while the city map is open', () {
    audio
      ..apply(const SoundSettings())
      ..enterCity();

    expect(output.loops[GameLoop.cityAmbience], 0.5);

    audio.leaveCity();

    expect(output.loops.keys, [GameLoop.music]);
  });

  test('transport sounds only play on the city map', () {
    audio
      ..apply(const SoundSettings())
      ..play(GameSound.busHorn);

    expect(output.played, isEmpty);

    audio
      ..enterCity()
      ..play(GameSound.busHorn);

    expect(output.played, [(GameSound.busHorn, 0.5)]);
  });

  test('everything goes quiet in the background and comes back after', () {
    audio
      ..apply(const SoundSettings())
      ..enterCity()
      ..toBackground()
      ..play(GameSound.tap);

    expect(output.loops, isEmpty);
    expect(output.played, isEmpty);

    audio.toForeground();

    expect(output.loops.keys, unorderedEquals(GameLoop.values));
  });

  test('each group follows its own switch and volume', () {
    audio
      ..apply(
        const SoundSettings(
          music: SoundLevel(enabled: false, volume: 0.5),
          effects: SoundLevel(volume: 0.3),
        ),
      )
      ..play(GameSound.tap);

    expect(output.loops, isEmpty);
    expect(output.played, [(GameSound.tap, 0.3)]);

    audio
      ..apply(const SoundSettings(music: SoundLevel(volume: 0.8)))
      ..play(GameSound.tap);

    expect(output.loops, {GameLoop.music: 0.8});
    expect(output.played.last, (GameSound.tap, 0.7));
  });
}
