import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/features/city_game/application/city_game_controller.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';

enum BoostOutcome { applied, notEnoughDiamonds, rejected }

final boostsProvider = Provider<Boosts>(Boosts.new);

class Boosts {
  Boosts(this._ref);

  final Ref _ref;

  Future<BoostOutcome> buy(
    CityId city, {
    required int cost,
    required CityCommand command,
    bool revive = false,
  }) async {
    final session = _ref.read(cityGameProvider(city)).value;
    if (session == null || command(session.city) is CommandRejected) {
      return BoostOutcome.rejected;
    }
    final profile = _ref.read(profileProvider.notifier);
    if (!await profile.spendDiamonds(cost)) {
      return BoostOutcome.notEnoughDiamonds;
    }
    final game = _ref.read(cityGameProvider(city).notifier);
    final outcome = revive ? await game.revive(command) : await game.perform(command);
    if (outcome is CommandRejected) {
      await profile.addDiamonds(cost);
      return BoostOutcome.rejected;
    }
    return BoostOutcome.applied;
  }
}
