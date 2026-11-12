enum AchievementId {
  firstBus(xp: 50),
  fleetBuilder(xp: 150),
  modernCity(xp: 300),
  greenRevolution(xp: 200),
  upgradeEnthusiast(xp: 100),
  roadWarrior(xp: 150),
  bikeFriendly(xp: 200),
  infrastructureMaster(xp: 500),
  economicStrategist(xp: 400),
  smilingCity(xp: 150),
  happyCitizens(xp: 500),
  risingCity(xp: 200),
  cityChampion(xp: 600),
  survivor(xp: 250),
  decisive(xp: 250),
  stormChaser(xp: 300),
  innovator(xp: 300),
  metroPioneer(xp: 250),
  veteranMinister(xp: 300);

  const AchievementId({required this.xp});

  final int xp;
}
