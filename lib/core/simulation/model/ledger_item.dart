enum LedgerItem {
  tickets,
  subsidy,
  governmentBudget,
  levelRewards,
  rewards,
  vehicleSales,
  loanReceived,
  energy,
  salaries,
  vehicleMaintenance,
  roadMaintenance,
  administration,
  loanRepayment,
  decisions,
  vehiclePurchases,
  vehicleUpgrades,
  construction,
  technology;

  bool get isOperating => switch (this) {
    LedgerItem.tickets ||
    LedgerItem.subsidy ||
    LedgerItem.energy ||
    LedgerItem.salaries ||
    LedgerItem.vehicleMaintenance ||
    LedgerItem.roadMaintenance ||
    LedgerItem.administration ||
    LedgerItem.loanRepayment ||
    LedgerItem.decisions => true,
    LedgerItem.governmentBudget ||
    LedgerItem.levelRewards ||
    LedgerItem.rewards ||
    LedgerItem.vehicleSales ||
    LedgerItem.loanReceived ||
    LedgerItem.vehiclePurchases ||
    LedgerItem.vehicleUpgrades ||
    LedgerItem.construction ||
    LedgerItem.technology => false,
  };
}
