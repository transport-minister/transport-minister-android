import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    required int id,
    required ProjectType type,
    required int totalDays,
    required int remainingDays,
    DistrictId? districtId,
  }) = _Project;

  const Project._();

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  double get progress => 1 - remainingDays / totalDays;
}
