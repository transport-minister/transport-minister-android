import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';

enum TutorialStep {
  welcome,
  budget,
  mood,
  district,
  buyBus,
  busBought,
  level,
  news,
  tasks,
  profile;

  bool get waitsForAction => this == district || this == buyBus;
}

final tutorialProvider = NotifierProvider<TutorialController, TutorialStep?>(
  TutorialController.new,
);

class TutorialController extends Notifier<TutorialStep?> {
  static const welcomeGift = 100000;
  static const rewardXp = 50;

  var _gifted = false;

  @override
  TutorialStep? build() => null;

  void start() {
    state ??= TutorialStep.welcome;
  }

  void next() {
    final step = state;
    if (step == null || step.waitsForAction) {
      return;
    }
    state = step == TutorialStep.values.last ? null : TutorialStep.values[step.index + 1];
  }

  void onDistrictOpened(CityId city) {
    if (state == TutorialStep.district) {
      state = TutorialStep.buyBus;
      _sendWelcomeGift(city);
    }
  }

  void _sendWelcomeGift(CityId city) {
    if (_gifted || !ref.read(cityGameProvider(city)).hasValue) {
      return;
    }
    _gifted = true;
    unawaited(
      ref
          .read(cityGameProvider(city).notifier)
          .perform((current) => const CityCommands().grantReward(current, welcomeGift)),
    );
  }

  void onDistrictClosed() {
    if (state == TutorialStep.buyBus) {
      state = TutorialStep.district;
    }
  }

  void onCityEvents(List<CityEvent> events) {
    if (state == TutorialStep.buyBus && events.any((event) => event is BusPurchased)) {
      state = TutorialStep.busBought;
    }
  }

  Future<void> finish(CityId city) async {
    state = null;
    await ref.read(profileProvider.notifier).completeTutorial();
    await ref.read(profileProvider.notifier).addXp(rewardXp);
  }

  Future<void> skip() async {
    state = null;
    await ref.read(profileProvider.notifier).completeTutorial();
  }
}
