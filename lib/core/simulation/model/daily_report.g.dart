// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReport _$DailyReportFromJson(Map<String, dynamic> json) => _DailyReport(
  day: (json['day'] as num).toInt(),
  ledger: (json['ledger'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$LedgerItemEnumMap, k), (e as num).toInt()),
  ),
  riders: (json['riders'] as num).toInt(),
  demand: (json['demand'] as num).toInt(),
  satisfaction: (json['satisfaction'] as num).toDouble(),
  budget: (json['budget'] as num).toInt(),
);

Map<String, dynamic> _$DailyReportToJson(_DailyReport instance) => <String, dynamic>{
  'day': instance.day,
  'ledger': instance.ledger.map((k, e) => MapEntry(_$LedgerItemEnumMap[k]!, e)),
  'riders': instance.riders,
  'demand': instance.demand,
  'satisfaction': instance.satisfaction,
  'budget': instance.budget,
};

const _$LedgerItemEnumMap = {
  LedgerItem.tickets: 'tickets',
  LedgerItem.subsidy: 'subsidy',
  LedgerItem.governmentBudget: 'governmentBudget',
  LedgerItem.levelRewards: 'levelRewards',
  LedgerItem.rewards: 'rewards',
  LedgerItem.vehicleSales: 'vehicleSales',
  LedgerItem.loanReceived: 'loanReceived',
  LedgerItem.energy: 'energy',
  LedgerItem.salaries: 'salaries',
  LedgerItem.vehicleMaintenance: 'vehicleMaintenance',
  LedgerItem.roadMaintenance: 'roadMaintenance',
  LedgerItem.administration: 'administration',
  LedgerItem.loanRepayment: 'loanRepayment',
  LedgerItem.decisions: 'decisions',
  LedgerItem.vehiclePurchases: 'vehiclePurchases',
  LedgerItem.vehicleUpgrades: 'vehicleUpgrades',
  LedgerItem.construction: 'construction',
  LedgerItem.technology: 'technology',
  LedgerItem.metro: 'metro',
};
