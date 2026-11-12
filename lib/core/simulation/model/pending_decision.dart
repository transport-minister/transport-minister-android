import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';

part 'pending_decision.freezed.dart';
part 'pending_decision.g.dart';

@freezed
abstract class PendingDecision with _$PendingDecision {
  const factory PendingDecision({
    required int id,
    required DecisionId template,
    required int createdTick,
    required int expiresTick,
    DistrictId? district,
  }) = _PendingDecision;

  factory PendingDecision.fromJson(Map<String, dynamic> json) => _$PendingDecisionFromJson(json);
}

@freezed
abstract class DecisionRecord with _$DecisionRecord {
  const factory DecisionRecord({
    required DecisionId template,
    required int option,
    required int tick,
    required bool riskTriggered,
    required bool automatic,
    DistrictId? district,
  }) = _DecisionRecord;

  factory DecisionRecord.fromJson(Map<String, dynamic> json) => _$DecisionRecordFromJson(json);
}
