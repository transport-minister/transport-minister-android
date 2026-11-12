import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/features/decisions/presentation/decision_texts.dart';
import 'package:transport_minister/features/technology/presentation/technology_texts.dart';
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
  };
}

extension CityEventText on CityEvent {
  bool get isSilent => switch (this) {
    DayClosed() ||
    CityLeveledUp() ||
    ReputationShift() ||
    DecisionArrived() ||
    RewardGranted() ||
    DiplomacyEarned() => true,
    DecisionResolved(:final automatic) => !automatic,
    _ => false,
  };

  String message(AppLocalizations l10n) => switch (this) {
    BusPurchased(:final count) => l10n.eventBusPurchased(count),
    BusUpgraded(:final level) => l10n.eventBusUpgraded(level),
    BusesDelivered(:final count) => l10n.eventBusesDelivered(count),
    ProjectStarted(:final type) => l10n.eventProjectStarted(type.label(l10n)),
    ProjectCompleted(:final type) => l10n.eventProjectCompleted(type.label(l10n)),
    BudgetAllocated(:final amount) => l10n.eventBudgetAllocated(MoneyFormat.compact(amount)),
    LoanRepaid() => l10n.eventLoanRepaid,
    CrisisWarning(:final level) => l10n.eventCrisisWarning(level),
    MinisterDismissed() => l10n.dismissedTitle,
    CityLeveledUp(:final level, :final reward) => l10n.eventCityLeveledUp(
      level,
      MoneyFormat.compact(reward),
    ),
    DayClosed(:final day) => l10n.hudDay(day),
    CrisisAverted() => l10n.eventCrisisAverted,
    DecisionArrived(:final decision, :final district) => l10n.eventDecisionArrived(
      decision.title(l10n, district),
    ),
    DecisionResolved(:final decision) => l10n.eventDecisionAutomatic(decision.title(l10n, null)),
    ReputationShift() => '',
    RewardGranted(:final amount) => MoneyFormat.signed(amount),
    DiplomacyEarned(:final amount) => l10n.decisionDiplomacyEarned(amount),
    TechnologyUnlocked(:final technology) => l10n.eventTechnologyUnlocked(technology.label(l10n)),
  };
}
