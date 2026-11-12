import 'dart:math' as math;

import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/city_day_runner.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';

import 'balance_bots.dart';

class CampaignResult {
  CampaignResult(this.bot, this.seed);

  final String bot;
  final int seed;
  late CityState city;
  int? dismissedDay;
  CrisisCause? dismissalCause;
  int? completedDay;
  int? firstWarningDay;
  int? firstPurchaseDay;
  int lowestBudget = 0;
  double highestCongestion = 0;
  int busyDays = 0;
  int startPopulation = 0;

  int get population => city.districts.fold(0, (sum, district) => sum + district.population);

  double get growth => population / startPopulation - 1;

  int get daysPlayed => city.day - 1;
}

CampaignResult runCampaign(BalanceBot bot, {required int seed, required int days}) {
  const runner = CityDayRunner();
  const metrics = MetricsCalculator();
  final result = CampaignResult(bot.name, seed);
  var city = const BakuScenario().create(seed: seed);
  result.startPopulation = city.districts.fold(0, (sum, district) => sum + district.population);
  for (var day = 0; day < days; day++) {
    final played = bot.play(city);
    if (!identical(played, city)) {
      result.busyDays++;
      result.firstPurchaseDay ??= city.day;
    }
    final today = metrics.calculate(played);
    result.highestCongestion = math.max(result.highestCongestion, today.congestion);
    final outcome = runner.advance(played);
    city = outcome.state;
    result.lowestBudget = math.min(result.lowestBudget, city.budget);
    if (outcome.events.any((event) => event is CrisisWarning)) {
      result.firstWarningDay ??= city.day;
    }
    if (city.crisis.dismissed) {
      result.dismissedDay = city.day;
      result.dismissalCause = city.crisis.cause;
      break;
    }
    if (city.completed) {
      result.completedDay = city.day;
      break;
    }
  }
  result.city = city;
  return result;
}
