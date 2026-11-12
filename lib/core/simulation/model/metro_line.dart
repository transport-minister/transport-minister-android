import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';

part 'metro_line.freezed.dart';
part 'metro_line.g.dart';

@freezed
abstract class MetroLine with _$MetroLine {
  const factory MetroLine({
    required DistrictId from,
    required DistrictId to,
    required int totalDays,
    required int remainingDays,
  }) = _MetroLine;

  const MetroLine._();

  factory MetroLine.fromJson(Map<String, dynamic> json) => _$MetroLineFromJson(json);

  bool get isOpen => remainingDays <= 0;

  double get progress => 1 - remainingDays / totalDays;

  bool connects(DistrictId district) => from == district || to == district;

  bool joins(DistrictId first, DistrictId second) =>
      first != second && connects(first) && connects(second);
}
