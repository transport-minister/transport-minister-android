import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension DecisionTexts on DecisionId {
  String title(AppLocalizations l10n, DistrictId? district) {
    final place = district?.displayName(l10n) ?? '';
    return switch (this) {
      DecisionId.overcrowdedBuses => l10n.decisionOvercrowdedBusesTitle(place),
      DecisionId.potholes => l10n.decisionPotholesTitle(place),
      DecisionId.bikePetition => l10n.decisionBikePetitionTitle,
      DecisionId.parkingChaos => l10n.decisionParkingChaosTitle(place),
      DecisionId.driverWages => l10n.decisionDriverWagesTitle,
      DecisionId.trafficAccident => l10n.decisionTrafficAccidentTitle,
      DecisionId.fuelSpike => l10n.decisionFuelSpikeTitle,
      DecisionId.busDiscount => l10n.decisionBusDiscountTitle,
      DecisionId.privateOperator => l10n.decisionPrivateOperatorTitle,
      DecisionId.budgetHearing => l10n.decisionBudgetHearingTitle,
      DecisionId.festival => l10n.decisionFestivalTitle,
      DecisionId.touristSeason => l10n.decisionTouristSeasonTitle,
      DecisionId.greenFund => l10n.decisionGreenFundTitle,
      DecisionId.flood => l10n.decisionFloodTitle(place),
      DecisionId.windStorm => l10n.decisionWindStormTitle,
      DecisionId.heatwave => l10n.decisionHeatwaveTitle,
      DecisionId.earthquake => l10n.decisionEarthquakeTitle,
      DecisionId.snowstorm => l10n.decisionSnowstormTitle,
      DecisionId.harborFire => l10n.decisionHarborFireTitle,
      DecisionId.landslide => l10n.decisionLandslideTitle,
    };
  }

  String body(AppLocalizations l10n, DistrictId? district) {
    final place = district?.displayName(l10n) ?? '';
    return switch (this) {
      DecisionId.overcrowdedBuses => l10n.decisionOvercrowdedBusesBody(place),
      DecisionId.potholes => l10n.decisionPotholesBody(place),
      DecisionId.bikePetition => l10n.decisionBikePetitionBody(place),
      DecisionId.parkingChaos => l10n.decisionParkingChaosBody(place),
      DecisionId.driverWages => l10n.decisionDriverWagesBody,
      DecisionId.trafficAccident => l10n.decisionTrafficAccidentBody(place),
      DecisionId.fuelSpike => l10n.decisionFuelSpikeBody,
      DecisionId.busDiscount => l10n.decisionBusDiscountBody(place),
      DecisionId.privateOperator => l10n.decisionPrivateOperatorBody(place),
      DecisionId.budgetHearing => l10n.decisionBudgetHearingBody,
      DecisionId.festival => l10n.decisionFestivalBody,
      DecisionId.touristSeason => l10n.decisionTouristSeasonBody,
      DecisionId.greenFund => l10n.decisionGreenFundBody,
      DecisionId.flood => l10n.decisionFloodBody(place),
      DecisionId.windStorm => l10n.decisionWindStormBody,
      DecisionId.heatwave => l10n.decisionHeatwaveBody,
      DecisionId.earthquake => l10n.decisionEarthquakeBody(place),
      DecisionId.snowstorm => l10n.decisionSnowstormBody,
      DecisionId.harborFire => l10n.decisionHarborFireBody,
      DecisionId.landslide => l10n.decisionLandslideBody,
    };
  }

  String option(AppLocalizations l10n, int index) {
    final options = switch (this) {
      DecisionId.overcrowdedBuses => [
        l10n.decisionOvercrowdedBusesOptionA,
        l10n.decisionOvercrowdedBusesOptionB,
        l10n.decisionOvercrowdedBusesOptionC,
      ],
      DecisionId.potholes => [
        l10n.decisionPotholesOptionA,
        l10n.decisionPotholesOptionB,
        l10n.decisionPotholesOptionC,
      ],
      DecisionId.bikePetition => [
        l10n.decisionBikePetitionOptionA,
        l10n.decisionBikePetitionOptionB,
        l10n.decisionBikePetitionOptionC,
      ],
      DecisionId.parkingChaos => [
        l10n.decisionParkingChaosOptionA,
        l10n.decisionParkingChaosOptionB,
        l10n.decisionParkingChaosOptionC,
      ],
      DecisionId.driverWages => [
        l10n.decisionDriverWagesOptionA,
        l10n.decisionDriverWagesOptionB,
        l10n.decisionDriverWagesOptionC,
      ],
      DecisionId.trafficAccident => [
        l10n.decisionTrafficAccidentOptionA,
        l10n.decisionTrafficAccidentOptionB,
        l10n.decisionTrafficAccidentOptionC,
      ],
      DecisionId.fuelSpike => [
        l10n.decisionFuelSpikeOptionA,
        l10n.decisionFuelSpikeOptionB,
        l10n.decisionFuelSpikeOptionC,
      ],
      DecisionId.busDiscount => [
        l10n.decisionBusDiscountOptionA,
        l10n.decisionBusDiscountOptionB,
        l10n.decisionBusDiscountOptionC,
      ],
      DecisionId.privateOperator => [
        l10n.decisionPrivateOperatorOptionA,
        l10n.decisionPrivateOperatorOptionB,
        l10n.decisionPrivateOperatorOptionC,
      ],
      DecisionId.budgetHearing => [
        l10n.decisionBudgetHearingOptionA,
        l10n.decisionBudgetHearingOptionB,
        l10n.decisionBudgetHearingOptionC,
        l10n.decisionBudgetHearingOptionD,
      ],
      DecisionId.festival => [
        l10n.decisionFestivalOptionA,
        l10n.decisionFestivalOptionB,
        l10n.decisionFestivalOptionC,
      ],
      DecisionId.touristSeason => [
        l10n.decisionTouristSeasonOptionA,
        l10n.decisionTouristSeasonOptionB,
        l10n.decisionTouristSeasonOptionC,
      ],
      DecisionId.greenFund => [l10n.decisionGreenFundOptionA, l10n.decisionGreenFundOptionB],
      DecisionId.flood => [
        l10n.decisionFloodOptionA,
        l10n.decisionFloodOptionB,
        l10n.decisionFloodOptionC,
      ],
      DecisionId.windStorm => [
        l10n.decisionWindStormOptionA,
        l10n.decisionWindStormOptionB,
        l10n.decisionWindStormOptionC,
      ],
      DecisionId.heatwave => [
        l10n.decisionHeatwaveOptionA,
        l10n.decisionHeatwaveOptionB,
        l10n.decisionHeatwaveOptionC,
      ],
      DecisionId.earthquake => [
        l10n.decisionEarthquakeOptionA,
        l10n.decisionEarthquakeOptionB,
        l10n.decisionEarthquakeOptionC,
      ],
      DecisionId.snowstorm => [
        l10n.decisionSnowstormOptionA,
        l10n.decisionSnowstormOptionB,
        l10n.decisionSnowstormOptionC,
      ],
      DecisionId.harborFire => [
        l10n.decisionHarborFireOptionA,
        l10n.decisionHarborFireOptionB,
        l10n.decisionHarborFireOptionC,
      ],
      DecisionId.landslide => [
        l10n.decisionLandslideOptionA,
        l10n.decisionLandslideOptionB,
        l10n.decisionLandslideOptionC,
      ],
    };
    return options[index];
  }
}

extension DecisionKindTexts on DecisionKind {
  String label(AppLocalizations l10n) => switch (this) {
    DecisionKind.request => l10n.kindRequest,
    DecisionKind.opportunity => l10n.kindOpportunity,
    DecisionKind.crisis => l10n.kindCrisis,
    DecisionKind.disaster => l10n.kindDisaster,
  };

  MrBusMood get mood => switch (this) {
    DecisionKind.request => MrBusMood.thinking,
    DecisionKind.opportunity => MrBusMood.excited,
    DecisionKind.crisis => MrBusMood.worried,
    DecisionKind.disaster => MrBusMood.shocked,
  };
}

extension StakeholderGroupTexts on StakeholderGroup {
  String label(AppLocalizations l10n) => switch (this) {
    StakeholderGroup.passengers => l10n.groupPassengers,
    StakeholderGroup.drivers => l10n.groupDrivers,
    StakeholderGroup.pedestrians => l10n.groupPedestrians,
    StakeholderGroup.cyclists => l10n.groupCyclists,
    StakeholderGroup.businesses => l10n.groupBusinesses,
    StakeholderGroup.transportWorkers => l10n.groupTransportWorkers,
    StakeholderGroup.environmentalists => l10n.groupEnvironmentalists,
    StakeholderGroup.logistics => l10n.groupLogistics,
  };
}

extension BusModelTexts on BusModelId {
  String label(AppLocalizations l10n) => switch (this) {
    BusModelId.veteran => l10n.busVeteran,
    BusModelId.hopMini => l10n.busHopMini,
    BusModelId.cityRunner => l10n.busCityRunner,
    BusModelId.megaLink => l10n.busMegaLink,
    BusModelId.voltaE => l10n.busVoltaE,
  };
}
