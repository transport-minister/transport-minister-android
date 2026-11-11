import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

part 'minister_profile.freezed.dart';
part 'minister_profile.g.dart';

@freezed
abstract class MinisterProfile with _$MinisterProfile {
  const factory MinisterProfile({@Default({}) Map<CityId, int> bestCityLevels}) = _MinisterProfile;

  const MinisterProfile._();

  factory MinisterProfile.fromJson(Map<String, dynamic> json) => _$MinisterProfileFromJson(json);

  int bestLevelIn(CityId city) => bestCityLevels[city] ?? 0;
}
