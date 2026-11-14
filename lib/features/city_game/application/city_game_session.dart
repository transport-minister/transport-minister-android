import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/city_game/domain/welcome_back.dart';

part 'city_game_session.freezed.dart';

@freezed
abstract class CityGameSession with _$CityGameSession {
  const factory CityGameSession({
    required CityState city,
    @Default([]) List<CityEvent> latestEvents,
    WelcomeBack? welcome,
  }) = _CityGameSession;
}
