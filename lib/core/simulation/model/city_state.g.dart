// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityState _$CityStateFromJson(Map<String, dynamic> json) => _CityState(
  seed: (json['seed'] as num).toInt(),
  tick: (json['tick'] as num).toInt(),
  budget: (json['budget'] as num).toInt(),
  fare: (json['fare'] as num).toInt(),
  depotCapacity: (json['depotCapacity'] as num).toInt(),
  roadMaintenance: $enumDecode(_$RoadMaintenanceLevelEnumMap, json['roadMaintenance']),
  districts: (json['districts'] as List<dynamic>)
      .map((e) => DistrictState.fromJson(e as Map<String, dynamic>))
      .toList(),
  fleet: (json['fleet'] as List<dynamic>)
      .map((e) => Bus.fromJson(e as Map<String, dynamic>))
      .toList(),
  satisfaction: (json['satisfaction'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$StakeholderGroupEnumMap, k), (e as num).toDouble()),
  ),
  projects:
      (json['projects'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  hasChargingDepot: json['hasChargingDepot'] as bool? ?? false,
  loan: json['loan'] == null ? null : Loan.fromJson(json['loan'] as Map<String, dynamic>),
  crisis: json['crisis'] == null
      ? const CrisisState()
      : CrisisState.fromJson(json['crisis'] as Map<String, dynamic>),
  stats: json['stats'] == null
      ? const CityStats()
      : CityStats.fromJson(json['stats'] as Map<String, dynamic>),
  pendingLedger:
      (json['pendingLedger'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$LedgerItemEnumMap, k), (e as num).toInt()),
      ) ??
      const {},
  nextId: (json['nextId'] as num?)?.toInt() ?? 1,
  developmentPoints: (json['developmentPoints'] as num?)?.toInt() ?? 0,
  decisions:
      (json['decisions'] as List<dynamic>?)
          ?.map((e) => PendingDecision.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  modifiers:
      (json['modifiers'] as List<dynamic>?)
          ?.map((e) => ActiveModifier.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  decisionLog:
      (json['decisionLog'] as List<dynamic>?)
          ?.map((e) => DecisionRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  lastDecisionTick: (json['lastDecisionTick'] as num?)?.toInt() ?? 0,
  diplomacyPoints: (json['diplomacyPoints'] as num?)?.toInt() ?? 0,
  technologies:
      (json['technologies'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$TechnologyIdEnumMap, e))
          .toSet() ??
      const {},
  metroLines:
      (json['metroLines'] as List<dynamic>?)
          ?.map((e) => MetroLine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  completed: json['completed'] as bool? ?? false,
);

Map<String, dynamic> _$CityStateToJson(_CityState instance) => <String, dynamic>{
  'seed': instance.seed,
  'tick': instance.tick,
  'budget': instance.budget,
  'fare': instance.fare,
  'depotCapacity': instance.depotCapacity,
  'roadMaintenance': _$RoadMaintenanceLevelEnumMap[instance.roadMaintenance]!,
  'districts': instance.districts.map((e) => e.toJson()).toList(),
  'fleet': instance.fleet.map((e) => e.toJson()).toList(),
  'satisfaction': instance.satisfaction.map((k, e) => MapEntry(_$StakeholderGroupEnumMap[k]!, e)),
  'projects': instance.projects.map((e) => e.toJson()).toList(),
  'hasChargingDepot': instance.hasChargingDepot,
  'loan': ?instance.loan?.toJson(),
  'crisis': instance.crisis.toJson(),
  'stats': instance.stats.toJson(),
  'pendingLedger': instance.pendingLedger.map((k, e) => MapEntry(_$LedgerItemEnumMap[k]!, e)),
  'nextId': instance.nextId,
  'developmentPoints': instance.developmentPoints,
  'decisions': instance.decisions.map((e) => e.toJson()).toList(),
  'modifiers': instance.modifiers.map((e) => e.toJson()).toList(),
  'decisionLog': instance.decisionLog.map((e) => e.toJson()).toList(),
  'lastDecisionTick': instance.lastDecisionTick,
  'diplomacyPoints': instance.diplomacyPoints,
  'technologies': instance.technologies.map((e) => _$TechnologyIdEnumMap[e]!).toList(),
  'metroLines': instance.metroLines.map((e) => e.toJson()).toList(),
  'completed': instance.completed,
};

const _$RoadMaintenanceLevelEnumMap = {
  RoadMaintenanceLevel.low: 'low',
  RoadMaintenanceLevel.normal: 'normal',
  RoadMaintenanceLevel.high: 'high',
};

const _$StakeholderGroupEnumMap = {
  StakeholderGroup.passengers: 'passengers',
  StakeholderGroup.drivers: 'drivers',
  StakeholderGroup.pedestrians: 'pedestrians',
  StakeholderGroup.cyclists: 'cyclists',
  StakeholderGroup.businesses: 'businesses',
  StakeholderGroup.transportWorkers: 'transportWorkers',
  StakeholderGroup.environmentalists: 'environmentalists',
  StakeholderGroup.logistics: 'logistics',
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

const _$TechnologyIdEnumMap = {
  TechnologyId.minibusContract: 'minibusContract',
  TechnologyId.articulatedContract: 'articulatedContract',
  TechnologyId.electricContract: 'electricContract',
  TechnologyId.engineTuning: 'engineTuning',
  TechnologyId.biggerCabins: 'biggerCabins',
  TechnologyId.comfortKit: 'comfortKit',
  TechnologyId.smartBuses: 'smartBuses',
  TechnologyId.metroStudy: 'metroStudy',
  TechnologyId.metroContract: 'metroContract',
  TechnologyId.metroAutomation: 'metroAutomation',
  TechnologyId.smartTicketing: 'smartTicketing',
  TechnologyId.ecoDriving: 'ecoDriving',
  TechnologyId.depotRobotics: 'depotRobotics',
};
