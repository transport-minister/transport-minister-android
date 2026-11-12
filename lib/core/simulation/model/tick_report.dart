import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';

part 'tick_report.freezed.dart';
part 'tick_report.g.dart';

@freezed
abstract class TickReport with _$TickReport {
  const factory TickReport({
    required int tick,
    required Map<LedgerItem, int> ledger,
    required int riders,
    required int demand,
    required double satisfaction,
    required int budget,
  }) = _DailyReport;

  const TickReport._();

  factory TickReport.fromJson(Map<String, dynamic> json) => _$DailyReportFromJson(json);

  int get operatingResult => ledger.entries
      .where((entry) => entry.key.isOperating)
      .fold(0, (sum, entry) => sum + entry.value);

  int get netChange => ledger.values.fold(0, (sum, amount) => sum + amount);
}
