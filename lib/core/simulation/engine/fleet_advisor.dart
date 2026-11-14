import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

class FleetAdvisor {
  const FleetAdvisor({this.projects = const ProjectRules()});

  final ProjectRules projects;

  static const needsBusesBelow = 0.9;
  static const _projectOrder = [
    ProjectType.roadRepair,
    ProjectType.smartSignals,
    ProjectType.bikeLanes,
    ProjectType.modernStops,
    ProjectType.cityPark,
    ProjectType.parkAndRide,
    ProjectType.roadExpansion,
  ];

  BusModelId bestModel(CityState state) {
    if (state.hasChargingDepot && state.has(TechnologyId.electricContract)) {
      return BusModelId.voltaE;
    }
    return state.has(TechnologyId.articulatedContract)
        ? BusModelId.megaLink
        : BusModelId.cityRunner;
  }

  int districtsNeedingBuses(CityState state, CityMetrics metrics) =>
      metrics.districts.where((district) => district.serviceRatio < needsBusesBelow).length;

  ProjectType? nextProject(CityState state, DistrictId district) {
    final target = state.district(district);
    for (final type in _projectOrder) {
      if (type == ProjectType.roadRepair && target.roadCondition >= 60) {
        continue;
      }
      if (projects.isUseful(state, type, district: district)) {
        return type;
      }
    }
    return null;
  }
}
