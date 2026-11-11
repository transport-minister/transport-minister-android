enum LedgerItem {
  tickets,
  subsidy,
  governmentBudget,
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
    LedgerItem.vehicleSales ||
    LedgerItem.loanReceived ||
    LedgerItem.vehiclePurchases ||
    LedgerItem.vehicleUpgrades ||
    LedgerItem.construction => false,
  };
}
