import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

enum TipKind {
  negativeBudget,
  presidentWatching,
  longWaits,
  brokenRoads,
  trafficJam,
  oldFleet,
  allGood;

  bool get isUrgent => this == negativeBudget || this == presidentWatching;
}

class AdvisorTip {
  const AdvisorTip(this.kind, {this.district, this.value = 0});

  final TipKind kind;
  final DistrictId? district;
  final int value;
}

class Advisor {
  const Advisor();

  static const longWaitMinutes = 15;
  static const brokenRoadCondition = 40;
  static const jamCongestion = 65;
  static const oldFleetReliability = 60;

  AdvisorTip bestTip(CityState city, CityMetrics metrics) {
    if (city.budget < 0) {
      return const AdvisorTip(TipKind.negativeBudget);
    }
    if (city.crisis.warnings > 0) {
      return const AdvisorTip(TipKind.presidentWatching);
    }
    final slowest = _max(metrics.districts, (district) => district.waitingMinutes);
    if (slowest.waitingMinutes >= longWaitMinutes) {
      return AdvisorTip(
        TipKind.longWaits,
        district: slowest.id,
        value: slowest.waitingMinutes.round(),
      );
    }
    final roughest = _max(city.districts, (district) => -district.roadCondition);
    if (roughest.roadCondition < brokenRoadCondition) {
      return AdvisorTip(
        TipKind.brokenRoads,
        district: roughest.id,
        value: roughest.roadCondition.round(),
      );
    }
    final jammed = _max(metrics.districts, (district) => district.congestion);
    if (jammed.congestion >= jamCongestion && !city.district(jammed.id).hasBikeLanes) {
      return AdvisorTip(TipKind.trafficJam, district: jammed.id, value: jammed.congestion.round());
    }
    if (metrics.fleetReliability < oldFleetReliability) {
      return AdvisorTip(TipKind.oldFleet, value: metrics.fleetReliability.round());
    }
    return const AdvisorTip(TipKind.allGood);
  }

  T _max<T>(Iterable<T> items, double Function(T) score) =>
      items.reduce((best, item) => score(item) > score(best) ? item : best);
}
