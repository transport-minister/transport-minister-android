import 'package:freezed_annotation/freezed_annotation.dart';

part 'crisis_state.freezed.dart';
part 'crisis_state.g.dart';

@freezed
abstract class CrisisState with _$CrisisState {
  const factory CrisisState({
    @Default(0) int days,
    @Default(0) int warnings,
    @Default(false) bool dismissed,
  }) = _CrisisState;

  factory CrisisState.fromJson(Map<String, dynamic> json) => _$CrisisStateFromJson(json);
}
