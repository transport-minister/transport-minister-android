enum LedgerItem {
  tickets,
  subsidy,
  governmentBudget,
  levelRewards,
  vehicleSales,
  loanReceived,
  energy,
  salaries,
  vehicleMaintenance,
  roadMaintenance,
  administration,
  loanRepayment,
  vehiclePurchases,
  vehicleUpgrades,
  construction;

  bool get isOperating => switch (this) {
    LedgerItem.tickets ||
    LedgerItem.subsidy ||
    LedgerItem.energy ||
    LedgerItem.salaries ||
    LedgerItem.vehicleMaintenance ||
    LedgerItem.roadMaintenance ||
    LedgerItem.administration ||
    LedgerItem.loanRepayment => true,
    LedgerItem.governmentBudget ||
    LedgerItem.levelRewards ||
    LedgerItem.vehicleSales ||
    LedgerItem.loanReceived ||
    LedgerItem.vehiclePurchases ||
    LedgerItem.vehicleUpgrades ||
    LedgerItem.construction => false,
  };
}
