// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityState {

 int get seed; int get day; int get budget; int get fare; int get depotCapacity; RoadMaintenanceLevel get roadMaintenance; List<DistrictState> get districts; List<Bus> get fleet; Map<StakeholderGroup, double> get satisfaction; List<Project> get projects; bool get hasChargingDepot; Loan? get loan; CrisisState get crisis; CityStats get stats; Map<LedgerItem, int> get pendingLedger; List<DailyReport> get reports; int get nextId; int get developmentPoints; List<PendingDecision> get decisions; List<ActiveModifier> get modifiers; List<DecisionRecord> get decisionLog; int get lastDecisionDay; int get diplomacyPoints; Set<TechnologyId> get technologies;
/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityStateCopyWith<CityState> get copyWith => _$CityStateCopyWithImpl<CityState>(this as CityState, _$identity);

  /// Serializes this CityState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CityState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityState&&(identical(other.seed, _this.seed) || other.seed == _this.seed)&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.budget, _this.budget) || other.budget == _this.budget)&&(identical(other.fare, _this.fare) || other.fare == _this.fare)&&(identical(other.depotCapacity, _this.depotCapacity) || other.depotCapacity == _this.depotCapacity)&&(identical(other.roadMaintenance, _this.roadMaintenance) || other.roadMaintenance == _this.roadMaintenance)&&const DeepCollectionEquality().equals(other.districts, _this.districts)&&const DeepCollectionEquality().equals(other.fleet, _this.fleet)&&const DeepCollectionEquality().equals(other.satisfaction, _this.satisfaction)&&const DeepCollectionEquality().equals(other.projects, _this.projects)&&(identical(other.hasChargingDepot, _this.hasChargingDepot) || other.hasChargingDepot == _this.hasChargingDepot)&&(identical(other.loan, _this.loan) || other.loan == _this.loan)&&(identical(other.crisis, _this.crisis) || other.crisis == _this.crisis)&&(identical(other.stats, _this.stats) || other.stats == _this.stats)&&const DeepCollectionEquality().equals(other.pendingLedger, _this.pendingLedger)&&const DeepCollectionEquality().equals(other.reports, _this.reports)&&(identical(other.nextId, _this.nextId) || other.nextId == _this.nextId)&&(identical(other.developmentPoints, _this.developmentPoints) || other.developmentPoints == _this.developmentPoints)&&const DeepCollectionEquality().equals(other.decisions, _this.decisions)&&const DeepCollectionEquality().equals(other.modifiers, _this.modifiers)&&const DeepCollectionEquality().equals(other.decisionLog, _this.decisionLog)&&(identical(other.lastDecisionDay, _this.lastDecisionDay) || other.lastDecisionDay == _this.lastDecisionDay)&&(identical(other.diplomacyPoints, _this.diplomacyPoints) || other.diplomacyPoints == _this.diplomacyPoints)&&const DeepCollectionEquality().equals(other.technologies, _this.technologies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CityState;
  return Object.hashAll([runtimeType,_this.seed,_this.day,_this.budget,_this.fare,_this.depotCapacity,_this.roadMaintenance,const DeepCollectionEquality().hash(_this.districts),const DeepCollectionEquality().hash(_this.fleet),const DeepCollectionEquality().hash(_this.satisfaction),const DeepCollectionEquality().hash(_this.projects),_this.hasChargingDepot,_this.loan,_this.crisis,_this.stats,const DeepCollectionEquality().hash(_this.pendingLedger),const DeepCollectionEquality().hash(_this.reports),_this.nextId,_this.developmentPoints,const DeepCollectionEquality().hash(_this.decisions),const DeepCollectionEquality().hash(_this.modifiers),const DeepCollectionEquality().hash(_this.decisionLog),_this.lastDecisionDay,_this.diplomacyPoints,const DeepCollectionEquality().hash(_this.technologies)]);
}

@override
String toString() {
  final _this = this as CityState;
  return 'CityState(seed: ${_this.seed}, day: ${_this.day}, budget: ${_this.budget}, fare: ${_this.fare}, depotCapacity: ${_this.depotCapacity}, roadMaintenance: ${_this.roadMaintenance}, districts: ${_this.districts}, fleet: ${_this.fleet}, satisfaction: ${_this.satisfaction}, projects: ${_this.projects}, hasChargingDepot: ${_this.hasChargingDepot}, loan: ${_this.loan}, crisis: ${_this.crisis}, stats: ${_this.stats}, pendingLedger: ${_this.pendingLedger}, reports: ${_this.reports}, nextId: ${_this.nextId}, developmentPoints: ${_this.developmentPoints}, decisions: ${_this.decisions}, modifiers: ${_this.modifiers}, decisionLog: ${_this.decisionLog}, lastDecisionDay: ${_this.lastDecisionDay}, diplomacyPoints: ${_this.diplomacyPoints}, technologies: ${_this.technologies})';
}


}

/// @nodoc
abstract mixin class $CityStateCopyWith<$Res>  {
  factory $CityStateCopyWith(CityState value, $Res Function(CityState) _then) = _$CityStateCopyWithImpl;
@useResult
$Res call({
 int seed, int day, int budget, int fare, int depotCapacity, RoadMaintenanceLevel roadMaintenance, List<DistrictState> districts, List<Bus> fleet, Map<StakeholderGroup, double> satisfaction, List<Project> projects, bool hasChargingDepot, Loan? loan, CrisisState crisis, CityStats stats, Map<LedgerItem, int> pendingLedger, List<DailyReport> reports, int nextId, int developmentPoints, List<PendingDecision> decisions, List<ActiveModifier> modifiers, List<DecisionRecord> decisionLog, int lastDecisionDay, int diplomacyPoints, Set<TechnologyId> technologies
});


$LoanCopyWith<$Res>? get loan;$CrisisStateCopyWith<$Res> get crisis;$CityStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$CityStateCopyWithImpl<$Res>
    implements $CityStateCopyWith<$Res> {
  _$CityStateCopyWithImpl(this._self, this._then);

  final CityState _self;
  final $Res Function(CityState) _then;

/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seed = null,Object? day = null,Object? budget = null,Object? fare = null,Object? depotCapacity = null,Object? roadMaintenance = null,Object? districts = null,Object? fleet = null,Object? satisfaction = null,Object? projects = null,Object? hasChargingDepot = null,Object? loan = freezed,Object? crisis = null,Object? stats = null,Object? pendingLedger = null,Object? reports = null,Object? nextId = null,Object? developmentPoints = null,Object? decisions = null,Object? modifiers = null,Object? decisionLog = null,Object? lastDecisionDay = null,Object? diplomacyPoints = null,Object? technologies = null,}) {
  return _then(CityState(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,fare: null == fare ? _self.fare : fare // ignore: cast_nullable_to_non_nullable
as int,depotCapacity: null == depotCapacity ? _self.depotCapacity : depotCapacity // ignore: cast_nullable_to_non_nullable
as int,roadMaintenance: null == roadMaintenance ? _self.roadMaintenance : roadMaintenance // ignore: cast_nullable_to_non_nullable
as RoadMaintenanceLevel,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<DistrictState>,fleet: null == fleet ? _self.fleet : fleet // ignore: cast_nullable_to_non_nullable
as List<Bus>,satisfaction: null == satisfaction ? _self.satisfaction : satisfaction // ignore: cast_nullable_to_non_nullable
as Map<StakeholderGroup, double>,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,hasChargingDepot: null == hasChargingDepot ? _self.hasChargingDepot : hasChargingDepot // ignore: cast_nullable_to_non_nullable
as bool,loan: freezed == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Loan?,crisis: null == crisis ? _self.crisis : crisis // ignore: cast_nullable_to_non_nullable
as CrisisState,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as CityStats,pendingLedger: null == pendingLedger ? _self.pendingLedger : pendingLedger // ignore: cast_nullable_to_non_nullable
as Map<LedgerItem, int>,reports: null == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as List<DailyReport>,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,developmentPoints: null == developmentPoints ? _self.developmentPoints : developmentPoints // ignore: cast_nullable_to_non_nullable
as int,decisions: null == decisions ? _self.decisions : decisions // ignore: cast_nullable_to_non_nullable
as List<PendingDecision>,modifiers: null == modifiers ? _self.modifiers : modifiers // ignore: cast_nullable_to_non_nullable
as List<ActiveModifier>,decisionLog: null == decisionLog ? _self.decisionLog : decisionLog // ignore: cast_nullable_to_non_nullable
as List<DecisionRecord>,lastDecisionDay: null == lastDecisionDay ? _self.lastDecisionDay : lastDecisionDay // ignore: cast_nullable_to_non_nullable
as int,diplomacyPoints: null == diplomacyPoints ? _self.diplomacyPoints : diplomacyPoints // ignore: cast_nullable_to_non_nullable
as int,technologies: null == technologies ? _self.technologies : technologies // ignore: cast_nullable_to_non_nullable
as Set<TechnologyId>,
  ));
}
/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoanCopyWith<$Res>? get loan {
    if (_self.loan == null) {
    return null;
  }

  return $LoanCopyWith<$Res>(_self.loan!, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CrisisStateCopyWith<$Res> get crisis {
  
  return $CrisisStateCopyWith<$Res>(_self.crisis, (value) {
    return _then(_self.copyWith(crisis: value));
  });
}/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityStatsCopyWith<$Res> get stats {
  
  return $CityStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [CityState].
extension CityStatePatterns on CityState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityState value)  $default,){
final _that = this;
switch (_that) {
case _CityState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityState value)?  $default,){
final _that = this;
switch (_that) {
case _CityState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seed,  int day,  int budget,  int fare,  int depotCapacity,  RoadMaintenanceLevel roadMaintenance,  List<DistrictState> districts,  List<Bus> fleet,  Map<StakeholderGroup, double> satisfaction,  List<Project> projects,  bool hasChargingDepot,  Loan? loan,  CrisisState crisis,  CityStats stats,  Map<LedgerItem, int> pendingLedger,  List<DailyReport> reports,  int nextId,  int developmentPoints,  List<PendingDecision> decisions,  List<ActiveModifier> modifiers,  List<DecisionRecord> decisionLog,  int lastDecisionDay,  int diplomacyPoints,  Set<TechnologyId> technologies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityState() when $default != null:
return $default(_that.seed,_that.day,_that.budget,_that.fare,_that.depotCapacity,_that.roadMaintenance,_that.districts,_that.fleet,_that.satisfaction,_that.projects,_that.hasChargingDepot,_that.loan,_that.crisis,_that.stats,_that.pendingLedger,_that.reports,_that.nextId,_that.developmentPoints,_that.decisions,_that.modifiers,_that.decisionLog,_that.lastDecisionDay,_that.diplomacyPoints,_that.technologies);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seed,  int day,  int budget,  int fare,  int depotCapacity,  RoadMaintenanceLevel roadMaintenance,  List<DistrictState> districts,  List<Bus> fleet,  Map<StakeholderGroup, double> satisfaction,  List<Project> projects,  bool hasChargingDepot,  Loan? loan,  CrisisState crisis,  CityStats stats,  Map<LedgerItem, int> pendingLedger,  List<DailyReport> reports,  int nextId,  int developmentPoints,  List<PendingDecision> decisions,  List<ActiveModifier> modifiers,  List<DecisionRecord> decisionLog,  int lastDecisionDay,  int diplomacyPoints,  Set<TechnologyId> technologies)  $default,) {final _that = this;
switch (_that) {
case _CityState():
return $default(_that.seed,_that.day,_that.budget,_that.fare,_that.depotCapacity,_that.roadMaintenance,_that.districts,_that.fleet,_that.satisfaction,_that.projects,_that.hasChargingDepot,_that.loan,_that.crisis,_that.stats,_that.pendingLedger,_that.reports,_that.nextId,_that.developmentPoints,_that.decisions,_that.modifiers,_that.decisionLog,_that.lastDecisionDay,_that.diplomacyPoints,_that.technologies);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seed,  int day,  int budget,  int fare,  int depotCapacity,  RoadMaintenanceLevel roadMaintenance,  List<DistrictState> districts,  List<Bus> fleet,  Map<StakeholderGroup, double> satisfaction,  List<Project> projects,  bool hasChargingDepot,  Loan? loan,  CrisisState crisis,  CityStats stats,  Map<LedgerItem, int> pendingLedger,  List<DailyReport> reports,  int nextId,  int developmentPoints,  List<PendingDecision> decisions,  List<ActiveModifier> modifiers,  List<DecisionRecord> decisionLog,  int lastDecisionDay,  int diplomacyPoints,  Set<TechnologyId> technologies)?  $default,) {final _that = this;
switch (_that) {
case _CityState() when $default != null:
return $default(_that.seed,_that.day,_that.budget,_that.fare,_that.depotCapacity,_that.roadMaintenance,_that.districts,_that.fleet,_that.satisfaction,_that.projects,_that.hasChargingDepot,_that.loan,_that.crisis,_that.stats,_that.pendingLedger,_that.reports,_that.nextId,_that.developmentPoints,_that.decisions,_that.modifiers,_that.decisionLog,_that.lastDecisionDay,_that.diplomacyPoints,_that.technologies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityState extends CityState {
  const _CityState({required this.seed, required this.day, required this.budget, required this.fare, required this.depotCapacity, required this.roadMaintenance, required  List<DistrictState> districts, required  List<Bus> fleet, required  Map<StakeholderGroup, double> satisfaction,  List<Project> projects = const [], this.hasChargingDepot = false, this.loan, this.crisis = const CrisisState(), this.stats = const CityStats(),  Map<LedgerItem, int> pendingLedger = const {},  List<DailyReport> reports = const [], this.nextId = 1, this.developmentPoints = 0,  List<PendingDecision> decisions = const [],  List<ActiveModifier> modifiers = const [],  List<DecisionRecord> decisionLog = const [], this.lastDecisionDay = 0, this.diplomacyPoints = 0,  Set<TechnologyId> technologies = const {}}): _districts = districts,_fleet = fleet,_satisfaction = satisfaction,_projects = projects,_pendingLedger = pendingLedger,_reports = reports,_decisions = decisions,_modifiers = modifiers,_decisionLog = decisionLog,_technologies = technologies,super._();
  factory _CityState.fromJson(Map<String, dynamic> json) => _$CityStateFromJson(json);

@override final  int seed;
@override final  int day;
@override final  int budget;
@override final  int fare;
@override final  int depotCapacity;
@override final  RoadMaintenanceLevel roadMaintenance;
 final  List<DistrictState> _districts;
@override List<DistrictState> get districts {
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_districts);
}

 final  List<Bus> _fleet;
@override List<Bus> get fleet {
  if (_fleet is EqualUnmodifiableListView) return _fleet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fleet);
}

 final  Map<StakeholderGroup, double> _satisfaction;
@override Map<StakeholderGroup, double> get satisfaction {
  if (_satisfaction is EqualUnmodifiableMapView) return _satisfaction;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_satisfaction);
}

 final  List<Project> _projects;
@override@JsonKey() List<Project> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override@JsonKey() final  bool hasChargingDepot;
@override final  Loan? loan;
@override@JsonKey() final  CrisisState crisis;
@override@JsonKey() final  CityStats stats;
 final  Map<LedgerItem, int> _pendingLedger;
@override@JsonKey() Map<LedgerItem, int> get pendingLedger {
  if (_pendingLedger is EqualUnmodifiableMapView) return _pendingLedger;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pendingLedger);
}

 final  List<DailyReport> _reports;
@override@JsonKey() List<DailyReport> get reports {
  if (_reports is EqualUnmodifiableListView) return _reports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reports);
}

@override@JsonKey() final  int nextId;
@override@JsonKey() final  int developmentPoints;
 final  List<PendingDecision> _decisions;
@override@JsonKey() List<PendingDecision> get decisions {
  if (_decisions is EqualUnmodifiableListView) return _decisions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_decisions);
}

 final  List<ActiveModifier> _modifiers;
@override@JsonKey() List<ActiveModifier> get modifiers {
  if (_modifiers is EqualUnmodifiableListView) return _modifiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modifiers);
}

 final  List<DecisionRecord> _decisionLog;
@override@JsonKey() List<DecisionRecord> get decisionLog {
  if (_decisionLog is EqualUnmodifiableListView) return _decisionLog;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_decisionLog);
}

@override@JsonKey() final  int lastDecisionDay;
@override@JsonKey() final  int diplomacyPoints;
 final  Set<TechnologyId> _technologies;
@override@JsonKey() Set<TechnologyId> get technologies {
  if (_technologies is EqualUnmodifiableSetView) return _technologies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_technologies);
}


/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityStateCopyWith<_CityState> get copyWith => __$CityStateCopyWithImpl<_CityState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityState&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.day, day) || other.day == day)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.fare, fare) || other.fare == fare)&&(identical(other.depotCapacity, depotCapacity) || other.depotCapacity == depotCapacity)&&(identical(other.roadMaintenance, roadMaintenance) || other.roadMaintenance == roadMaintenance)&&const DeepCollectionEquality().equals(other.districts, _districts)&&const DeepCollectionEquality().equals(other.fleet, _fleet)&&const DeepCollectionEquality().equals(other.satisfaction, _satisfaction)&&const DeepCollectionEquality().equals(other.projects, _projects)&&(identical(other.hasChargingDepot, hasChargingDepot) || other.hasChargingDepot == hasChargingDepot)&&(identical(other.loan, loan) || other.loan == loan)&&(identical(other.crisis, crisis) || other.crisis == crisis)&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other.pendingLedger, _pendingLedger)&&const DeepCollectionEquality().equals(other.reports, _reports)&&(identical(other.nextId, nextId) || other.nextId == nextId)&&(identical(other.developmentPoints, developmentPoints) || other.developmentPoints == developmentPoints)&&const DeepCollectionEquality().equals(other.decisions, _decisions)&&const DeepCollectionEquality().equals(other.modifiers, _modifiers)&&const DeepCollectionEquality().equals(other.decisionLog, _decisionLog)&&(identical(other.lastDecisionDay, lastDecisionDay) || other.lastDecisionDay == lastDecisionDay)&&(identical(other.diplomacyPoints, diplomacyPoints) || other.diplomacyPoints == diplomacyPoints)&&const DeepCollectionEquality().equals(other.technologies, _technologies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,seed,day,budget,fare,depotCapacity,roadMaintenance,const DeepCollectionEquality().hash(_districts),const DeepCollectionEquality().hash(_fleet),const DeepCollectionEquality().hash(_satisfaction),const DeepCollectionEquality().hash(_projects),hasChargingDepot,loan,crisis,stats,const DeepCollectionEquality().hash(_pendingLedger),const DeepCollectionEquality().hash(_reports),nextId,developmentPoints,const DeepCollectionEquality().hash(_decisions),const DeepCollectionEquality().hash(_modifiers),const DeepCollectionEquality().hash(_decisionLog),lastDecisionDay,diplomacyPoints,const DeepCollectionEquality().hash(_technologies)]);
}

@override
String toString() {
    return 'CityState(seed: $seed, day: $day, budget: $budget, fare: $fare, depotCapacity: $depotCapacity, roadMaintenance: $roadMaintenance, districts: $districts, fleet: $fleet, satisfaction: $satisfaction, projects: $projects, hasChargingDepot: $hasChargingDepot, loan: $loan, crisis: $crisis, stats: $stats, pendingLedger: $pendingLedger, reports: $reports, nextId: $nextId, developmentPoints: $developmentPoints, decisions: $decisions, modifiers: $modifiers, decisionLog: $decisionLog, lastDecisionDay: $lastDecisionDay, diplomacyPoints: $diplomacyPoints, technologies: $technologies)';
}


}

/// @nodoc
abstract mixin class _$CityStateCopyWith<$Res> implements $CityStateCopyWith<$Res> {
  factory _$CityStateCopyWith(_CityState value, $Res Function(_CityState) _then) = __$CityStateCopyWithImpl;
@override @useResult
$Res call({
 int seed, int day, int budget, int fare, int depotCapacity, RoadMaintenanceLevel roadMaintenance, List<DistrictState> districts, List<Bus> fleet, Map<StakeholderGroup, double> satisfaction, List<Project> projects, bool hasChargingDepot, Loan? loan, CrisisState crisis, CityStats stats, Map<LedgerItem, int> pendingLedger, List<DailyReport> reports, int nextId, int developmentPoints, List<PendingDecision> decisions, List<ActiveModifier> modifiers, List<DecisionRecord> decisionLog, int lastDecisionDay, int diplomacyPoints, Set<TechnologyId> technologies
});


@override $LoanCopyWith<$Res>? get loan;@override $CrisisStateCopyWith<$Res> get crisis;@override $CityStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$CityStateCopyWithImpl<$Res>
    implements _$CityStateCopyWith<$Res> {
  __$CityStateCopyWithImpl(this._self, this._then);

  final _CityState _self;
  final $Res Function(_CityState) _then;

/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seed = null,Object? day = null,Object? budget = null,Object? fare = null,Object? depotCapacity = null,Object? roadMaintenance = null,Object? districts = null,Object? fleet = null,Object? satisfaction = null,Object? projects = null,Object? hasChargingDepot = null,Object? loan = freezed,Object? crisis = null,Object? stats = null,Object? pendingLedger = null,Object? reports = null,Object? nextId = null,Object? developmentPoints = null,Object? decisions = null,Object? modifiers = null,Object? decisionLog = null,Object? lastDecisionDay = null,Object? diplomacyPoints = null,Object? technologies = null,}) {
  return _then(_CityState(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,fare: null == fare ? _self.fare : fare // ignore: cast_nullable_to_non_nullable
as int,depotCapacity: null == depotCapacity ? _self.depotCapacity : depotCapacity // ignore: cast_nullable_to_non_nullable
as int,roadMaintenance: null == roadMaintenance ? _self.roadMaintenance : roadMaintenance // ignore: cast_nullable_to_non_nullable
as RoadMaintenanceLevel,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<DistrictState>,fleet: null == fleet ? _self._fleet : fleet // ignore: cast_nullable_to_non_nullable
as List<Bus>,satisfaction: null == satisfaction ? _self._satisfaction : satisfaction // ignore: cast_nullable_to_non_nullable
as Map<StakeholderGroup, double>,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,hasChargingDepot: null == hasChargingDepot ? _self.hasChargingDepot : hasChargingDepot // ignore: cast_nullable_to_non_nullable
as bool,loan: freezed == loan ? _self.loan : loan // ignore: cast_nullable_to_non_nullable
as Loan?,crisis: null == crisis ? _self.crisis : crisis // ignore: cast_nullable_to_non_nullable
as CrisisState,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as CityStats,pendingLedger: null == pendingLedger ? _self._pendingLedger : pendingLedger // ignore: cast_nullable_to_non_nullable
as Map<LedgerItem, int>,reports: null == reports ? _self._reports : reports // ignore: cast_nullable_to_non_nullable
as List<DailyReport>,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,developmentPoints: null == developmentPoints ? _self.developmentPoints : developmentPoints // ignore: cast_nullable_to_non_nullable
as int,decisions: null == decisions ? _self._decisions : decisions // ignore: cast_nullable_to_non_nullable
as List<PendingDecision>,modifiers: null == modifiers ? _self._modifiers : modifiers // ignore: cast_nullable_to_non_nullable
as List<ActiveModifier>,decisionLog: null == decisionLog ? _self._decisionLog : decisionLog // ignore: cast_nullable_to_non_nullable
as List<DecisionRecord>,lastDecisionDay: null == lastDecisionDay ? _self.lastDecisionDay : lastDecisionDay // ignore: cast_nullable_to_non_nullable
as int,diplomacyPoints: null == diplomacyPoints ? _self.diplomacyPoints : diplomacyPoints // ignore: cast_nullable_to_non_nullable
as int,technologies: null == technologies ? _self._technologies : technologies // ignore: cast_nullable_to_non_nullable
as Set<TechnologyId>,
  ));
}

/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoanCopyWith<$Res>? get loan {
    if (_self.loan == null) {
    return null;
  }

  return $LoanCopyWith<$Res>(_self.loan!, (value) {
    return _then(_self.copyWith(loan: value));
  });
}/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CrisisStateCopyWith<$Res> get crisis {
  
  return $CrisisStateCopyWith<$Res>(_self.crisis, (value) {
    return _then(_self.copyWith(crisis: value));
  });
}/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityStatsCopyWith<$Res> get stats {
  
  return $CityStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
