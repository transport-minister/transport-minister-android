import 'dart:math' as math;

import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/city_tick_runner.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';

import 'balance_bots.dart';

const turnSeconds = 30;

class CampaignResult {
  CampaignResult(this.bot, this.seed);

  final String bot;
  final int seed;
  late CityState city;
  int? dismissedSecond;
  CrisisCause? dismissalCause;
  int? completedSecond;
  int? firstWarningSecond;
  int? firstPurchaseSecond;
  int lowestBudget = 0;
  double highestCongestion = 0;
  int turns = 0;
  int busyTurns = 0;
  double startPopulation = 0;

  double get population => city.districts.fold(0, (sum, district) => sum + district.population);

  double get growth => population / startPopulation - 1;
}

CampaignResult runCampaign(BalanceBot bot, {required int seed, required int minutes}) {
  const runner = CityTickRunner();
  const metrics = MetricsCalculator();
  final result = CampaignResult(bot.name, seed);
  var city = const BakuScenario().create(seed: seed);
  result.startPopulation = city.districts.fold(0, (sum, district) => sum + district.population);
  for (var second = 0; second < minutes * 60; second++) {
    if (second % turnSeconds == 0) {
      final played = bot.play(city);
      result.turns++;
      if (!identical(played, city)) {
        result.busyTurns++;
        result.firstPurchaseSecond ??= city.tick;
      }
      city = played;
      result.highestCongestion = math.max(
        result.highestCongestion,
        metrics.calculate(city).congestion,
      );
    }
    final outcome = runner.advance(city);
    city = outcome.state;
    result.lowestBudget = math.min(result.lowestBudget, city.budget);
    if (outcome.events.any((event) => event is CrisisWarning)) {
      result.firstWarningSecond ??= city.tick;
    }
    if (city.crisis.dismissed) {
      result.dismissedSecond = city.tick;
      result.dismissalCause = city.crisis.cause;
      break;
    }
    if (city.completed) {
      result.completedSecond = city.tick;
      break;
    }
  }
  result.city = city;
  return result;
}
