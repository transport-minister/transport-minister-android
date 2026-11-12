import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';

enum TechBranch { buses, upgrades, metro, operations }

enum TechnologyId {
  minibusContract(TechBranch.buses, money: 50000, diplomacy: 12),
  articulatedContract(TechBranch.buses, money: 150000, diplomacy: 30),
  electricContract(TechBranch.buses, money: 400000, diplomacy: 60),
  engineTuning(TechBranch.upgrades, money: 60000, diplomacy: 9),
  biggerCabins(TechBranch.upgrades, money: 120000, diplomacy: 22),
  comfortKit(TechBranch.upgrades, money: 200000, diplomacy: 38),
  smartBuses(TechBranch.upgrades, money: 350000, diplomacy: 60),
  metroStudy(TechBranch.metro, money: 250000, diplomacy: 30),
  metroContract(TechBranch.metro, money: 1000000, diplomacy: 75),
  metroAutomation(TechBranch.metro, money: 1500000, diplomacy: 105),
  smartTicketing(TechBranch.operations, money: 100000, diplomacy: 18),
  ecoDriving(TechBranch.operations, money: 150000, diplomacy: 27),
  depotRobotics(TechBranch.operations, money: 250000, diplomacy: 45);

  const TechnologyId(this.branch, {required this.money, required this.diplomacy});

  final TechBranch branch;
  final int money;
  final int diplomacy;

  TechnologyId? get requires => switch (this) {
    articulatedContract => minibusContract,
    electricContract => articulatedContract,
    biggerCabins => engineTuning,
    comfortKit => biggerCabins,
    smartBuses => comfortKit,
    metroContract => metroStudy,
    metroAutomation => metroContract,
    ecoDriving => smartTicketing,
    depotRobotics => ecoDriving,
    minibusContract || engineTuning || metroStudy || smartTicketing => null,
  };

  static TechnologyId? forModel(BusModelId model) => switch (model) {
    BusModelId.veteran || BusModelId.cityRunner => null,
    BusModelId.hopMini => minibusContract,
    BusModelId.megaLink => articulatedContract,
    BusModelId.voltaE => electricContract,
  };

  static TechnologyId? forUpgradeLevel(int level) => switch (level) {
    2 => engineTuning,
    3 => biggerCabins,
    4 => comfortKit,
    5 => smartBuses,
    _ => null,
  };
}
