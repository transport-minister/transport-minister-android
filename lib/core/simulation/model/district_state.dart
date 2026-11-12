import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';

part 'district_state.freezed.dart';
part 'district_state.g.dart';

@freezed
abstract class DistrictState with _$DistrictState {
  const factory DistrictState({
    required DistrictId id,
    required double population,
    required double roadCondition,
    required int roadLevel,
    @Default(false) bool hasBikeLanes,
    @Default(0) double bikeAdoption,
    @Default(false) bool hasSmartSignals,
    @Default(false) bool hasModernStops,
  }) = _DistrictState;

  factory DistrictState.fromJson(Map<String, dynamic> json) => _$DistrictStateFromJson(json);
}
