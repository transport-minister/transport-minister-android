// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Loan _$LoanFromJson(Map<String, dynamic> json) => _Loan(
  principal: (json['principal'] as num).toInt(),
  installment: (json['installment'] as num).toInt(),
  remainingSeconds: (json['remainingSeconds'] as num).toInt(),
);

Map<String, dynamic> _$LoanToJson(_Loan instance) => <String, dynamic>{
  'principal': instance.principal,
  'installment': instance.installment,
  'remainingSeconds': instance.remainingSeconds,
};
