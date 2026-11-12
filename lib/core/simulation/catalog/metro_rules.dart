abstract final class MetroRules {
  static const buildCost = 1500000;
  static const buildDays = 8;
  static const dailyCost = 2400;
  static const ridersPerStation = 1400;
  static const congestionRelief = 7.0;
  static const constructionCongestion = 10.0;
  static const automationCostFactor = 0.6;
  static const automationRidersFactor = 1.3;

  static int stationRiders({required bool automated}) =>
      (ridersPerStation * (automated ? automationRidersFactor : 1)).round();

  static int lineCost({required bool automated}) =>
      (dailyCost * (automated ? automationCostFactor : 1)).round();
}
