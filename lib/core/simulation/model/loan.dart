import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan.freezed.dart';
part 'loan.g.dart';

@freezed
abstract class Loan with _$Loan {
  const factory Loan({
    required int principal,
    required int installment,
    required int remainingSeconds,
  }) = _Loan;

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);
}
