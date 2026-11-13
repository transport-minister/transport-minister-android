enum SoundGroup { music, effects, city }

enum GameSound {
  tap(SoundGroup.effects),
  busHorn(SoundGroup.city),
  busPass(SoundGroup.city),
  busDoors(SoundGroup.city),
  metroTrain(SoundGroup.city);

  const GameSound(this.group);

  final SoundGroup group;
}

enum GameLoop {
  music(SoundGroup.music),
  cityAmbience(SoundGroup.city);

  const GameLoop(this.group);

  final SoundGroup group;
}
