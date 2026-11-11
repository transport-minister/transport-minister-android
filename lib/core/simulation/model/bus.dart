import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';

part 'bus.freezed.dart';
part 'bus.g.dart';

@freezed
abstract class Bus with _$Bus {
  const factory Bus({
    required int id,
    required BusModelId model,
    required DistrictId districtId,
    @Default(1) int level,
    @Default(0) int ageDays,
    @Default(0) int deliveryDay,
  }) = _Bus;

  const Bus._();

  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

  bool isActiveOn(int day) => deliveryDay <= day;
}
