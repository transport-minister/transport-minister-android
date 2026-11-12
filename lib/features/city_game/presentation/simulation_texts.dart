import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension LedgerItemText on LedgerItem {
  String label(AppLocalizations l10n) => switch (this) {
    LedgerItem.tickets => l10n.ledgerTickets,
    LedgerItem.subsidy => l10n.ledgerSubsidy,
    LedgerItem.governmentBudget => l10n.ledgerGovernmentBudget,
    LedgerItem.levelRewards => l10n.ledgerLevelRewards,
    LedgerItem.rewards => l10n.ledgerRewards,
    LedgerItem.vehicleSales => l10n.ledgerVehicleSales,
    LedgerItem.loanReceived => l10n.ledgerLoanReceived,
    LedgerItem.energy => l10n.ledgerEnergy,
    LedgerItem.salaries => l10n.ledgerSalaries,
    LedgerItem.vehicleMaintenance => l10n.ledgerVehicleMaintenance,
    LedgerItem.roadMaintenance => l10n.ledgerRoadMaintenance,
    LedgerItem.administration => l10n.ledgerAdministration,
    LedgerItem.loanRepayment => l10n.ledgerLoanRepayment,
    LedgerItem.decisions => l10n.ledgerDecisions,
    LedgerItem.vehiclePurchases => l10n.ledgerVehiclePurchases,
    LedgerItem.vehicleUpgrades => l10n.ledgerVehicleUpgrades,
    LedgerItem.construction => l10n.ledgerConstruction,
    LedgerItem.technology => l10n.ledgerTechnology,
    LedgerItem.metro => l10n.ledgerMetro,
  };
}

extension ProjectTypeText on ProjectType {
  String label(AppLocalizations l10n) => switch (this) {
    ProjectType.roadRepair => l10n.projectRoadRepair,
    ProjectType.roadExpansion => l10n.projectRoadExpansion,
    ProjectType.bikeLanes => l10n.projectBikeLanes,
    ProjectType.smartSignals => l10n.projectSmartSignals,
    ProjectType.modernStops => l10n.projectModernStops,
    ProjectType.chargingDepot => l10n.projectChargingDepot,
    ProjectType.depotExpansion => l10n.projectDepotExpansion,
  };
}

extension RejectionReasonText on RejectionReason {
  String message(AppLocalizations l10n) => switch (this) {
    RejectionReason.insufficientFunds => l10n.rejectInsufficientFunds,
    RejectionReason.depotFull => l10n.rejectDepotFull,
    RejectionReason.maxLevelReached => l10n.rejectMaxLevel,
    RejectionReason.projectLimitReached => l10n.rejectProjectLimit,
    RejectionReason.alreadyInProgress => l10n.rejectAlreadyInProgress,
    RejectionReason.alreadyBuilt => l10n.rejectAlreadyBuilt,
    RejectionReason.requiresChargingDepot => l10n.rejectRequiresChargingDepot,
    RejectionReason.invalidTarget => l10n.rejectInvalidTarget,
    RejectionReason.loanActive => l10n.rejectLoanActive,
    RejectionReason.fareOutOfRange => l10n.rejectFareOutOfRange,
    RejectionReason.locked => l10n.rejectLocked,
    RejectionReason.insufficientDiplomacy => l10n.rejectInsufficientDiplomacy,
    RejectionReason.alreadyUnlocked => l10n.rejectAlreadyUnlocked,
    RejectionReason.tunnelBusy => l10n.rejectTunnelBusy,
  };
}
