// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Loan _$LoanFromJson(Map<String, dynamic> json) => _Loan(
  principal: (json['principal'] as num).toInt(),
  dailyInstallment: (json['dailyInstallment'] as num).toInt(),
  remainingDays: (json['remainingDays'] as num).toInt(),
);

Map<String, dynamic> _$LoanToJson(_Loan instance) => <String, dynamic>{
  'principal': instance.principal,
  'dailyInstallment': instance.dailyInstallment,
  'remainingDays': instance.remainingDays,
};
