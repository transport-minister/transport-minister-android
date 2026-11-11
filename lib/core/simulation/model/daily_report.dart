import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';

part 'daily_report.freezed.dart';
part 'daily_report.g.dart';

@freezed
abstract class DailyReport with _$DailyReport {
  const factory DailyReport({
    required int day,
    required Map<LedgerItem, int> ledger,
    required int riders,
    required int demand,
    required double satisfaction,
    required int budget,
  }) = _DailyReport;

  const DailyReport._();

  factory DailyReport.fromJson(Map<String, dynamic> json) => _$DailyReportFromJson(json);

  int get operatingResult => ledger.entries
      .where((entry) => entry.key.isOperating)
      .fold(0, (sum, entry) => sum + entry.value);

  int get netChange => ledger.values.fold(0, (sum, amount) => sum + amount);
}
