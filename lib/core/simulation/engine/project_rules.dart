import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/district_state.dart';

class ProjectRules {
  const ProjectRules();

  static const maxRoadLevel = 3;
  static const maxDepotCapacity = 100;
  static const depotExpansionStep = 20;

  int cost(CityState state, ProjectType type, {DistrictId? district}) {
    final target = district == null ? null : state.district(district);
    return switch (type) {
      ProjectType.roadRepair => 10000 + (400 * (100 - (target?.roadCondition ?? 100))).round(),
      ProjectType.roadExpansion => (target?.roadLevel ?? 1) == 1 ? 600000 : 1100000,
      ProjectType.bikeLanes => 250000,
      ProjectType.smartSignals => 180000,
      ProjectType.modernStops => 120000,
      ProjectType.chargingDepot => 900000,
      ProjectType.depotExpansion => 500000,
    };
  }

  int duration(CityState state, ProjectType type, {DistrictId? district}) {
    final target = district == null ? null : state.district(district);
    return switch (type) {
      ProjectType.roadRepair => 60,
      ProjectType.roadExpansion => (target?.roadLevel ?? 1) == 1 ? 150 : 240,
      ProjectType.bikeLanes => 120,
      ProjectType.smartSignals => 90,
      ProjectType.modernStops => 60,
      ProjectType.chargingDepot => 180,
      ProjectType.depotExpansion => 120,
    };
  }

  RejectionReason? validate(CityState state, ProjectType type, {DistrictId? district}) {
    if (type.isCityWide != (district == null)) {
      return RejectionReason.invalidTarget;
    }
    if (state.projects.length >= GameBalance.maxActiveProjects) {
      return RejectionReason.projectLimitReached;
    }
    final busy = type.isCityWide
        ? state.projects.any((project) => project.type == type)
        : state.projects.any((project) => project.districtId == district);
    if (busy) {
      return RejectionReason.alreadyInProgress;
    }
    if (!isUseful(state, type, district: district)) {
      return RejectionReason.alreadyBuilt;
    }
    if (state.budget < cost(state, type, district: district)) {
      return RejectionReason.insufficientFunds;
    }
    return null;
  }

  bool isUseful(CityState state, ProjectType type, {DistrictId? district}) {
    final target = district == null ? null : state.district(district);
    return switch (type) {
      ProjectType.roadRepair => target!.roadCondition < 95,
      ProjectType.roadExpansion => target!.roadLevel < maxRoadLevel,
      ProjectType.bikeLanes => !target!.hasBikeLanes,
      ProjectType.smartSignals => !target!.hasSmartSignals,
      ProjectType.modernStops => !target!.hasModernStops,
      ProjectType.chargingDepot => !state.hasChargingDepot,
      ProjectType.depotExpansion => state.depotCapacity < maxDepotCapacity,
    };
  }

  CityState complete(CityState state, ProjectType type, DistrictId? district) {
    if (district == null) {
      return switch (type) {
        ProjectType.chargingDepot => state.copyWith(hasChargingDepot: true),
        ProjectType.depotExpansion => state.copyWith(
          depotCapacity: state.depotCapacity + depotExpansionStep,
        ),
        _ => state,
      };
    }
    return state.copyWith(
      districts: [
        for (final current in state.districts)
          current.id == district ? _upgrade(current, type) : current,
      ],
    );
  }

  DistrictState _upgrade(DistrictState district, ProjectType type) => switch (type) {
    ProjectType.roadRepair => district.copyWith(roadCondition: 100),
    ProjectType.roadExpansion => district.copyWith(
      roadLevel: district.roadLevel + 1,
      roadCondition: 100,
    ),
    ProjectType.bikeLanes => district.copyWith(hasBikeLanes: true, bikeAdoption: 0),
    ProjectType.smartSignals => district.copyWith(hasSmartSignals: true),
    ProjectType.modernStops => district.copyWith(hasModernStops: true),
    ProjectType.chargingDepot || ProjectType.depotExpansion => district,
  };
}
