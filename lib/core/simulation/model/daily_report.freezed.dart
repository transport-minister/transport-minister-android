// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReport {

 int get day; Map<LedgerItem, int> get ledger; int get riders; int get demand; double get satisfaction; int get budget;
/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportCopyWith<DailyReport> get copyWith => _$DailyReportCopyWithImpl<DailyReport>(this as DailyReport, _$identity);

  /// Serializes this DailyReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReport&&(identical(other.day, _this.day) || other.day == _this.day)&&const DeepCollectionEquality().equals(other.ledger, _this.ledger)&&(identical(other.riders, _this.riders) || other.riders == _this.riders)&&(identical(other.demand, _this.demand) || other.demand == _this.demand)&&(identical(other.satisfaction, _this.satisfaction) || other.satisfaction == _this.satisfaction)&&(identical(other.budget, _this.budget) || other.budget == _this.budget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyReport;
  return Object.hash(runtimeType,_this.day,const DeepCollectionEquality().hash(_this.ledger),_this.riders,_this.demand,_this.satisfaction,_this.budget);
}

@override
String toString() {
  final _this = this as DailyReport;
  return 'DailyReport(day: ${_this.day}, ledger: ${_this.ledger}, riders: ${_this.riders}, demand: ${_this.demand}, satisfaction: ${_this.satisfaction}, budget: ${_this.budget})';
}


}

/// @nodoc
abstract mixin class $DailyReportCopyWith<$Res>  {
  factory $DailyReportCopyWith(DailyReport value, $Res Function(DailyReport) _then) = _$DailyReportCopyWithImpl;
@useResult
$Res call({
 int day, Map<LedgerItem, int> ledger, int riders, int demand, double satisfaction, int budget
});




}
/// @nodoc
class _$DailyReportCopyWithImpl<$Res>
    implements $DailyReportCopyWith<$Res> {
  _$DailyReportCopyWithImpl(this._self, this._then);

  final DailyReport _self;
  final $Res Function(DailyReport) _then;

/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? ledger = null,Object? riders = null,Object? demand = null,Object? satisfaction = null,Object? budget = null,}) {
  return _then(DailyReport(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,ledger: null == ledger ? _self.ledger : ledger // ignore: cast_nullable_to_non_nullable
as Map<LedgerItem, int>,riders: null == riders ? _self.riders : riders // ignore: cast_nullable_to_non_nullable
as int,demand: null == demand ? _self.demand : demand // ignore: cast_nullable_to_non_nullable
as int,satisfaction: null == satisfaction ? _self.satisfaction : satisfaction // ignore: cast_nullable_to_non_nullable
as double,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReport].
extension DailyReportPatterns on DailyReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReport value)  $default,){
final _that = this;
switch (_that) {
case _DailyReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReport value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int day,  Map<LedgerItem, int> ledger,  int riders,  int demand,  double satisfaction,  int budget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
return $default(_that.day,_that.ledger,_that.riders,_that.demand,_that.satisfaction,_that.budget);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int day,  Map<LedgerItem, int> ledger,  int riders,  int demand,  double satisfaction,  int budget)  $default,) {final _that = this;
switch (_that) {
case _DailyReport():
return $default(_that.day,_that.ledger,_that.riders,_that.demand,_that.satisfaction,_that.budget);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int day,  Map<LedgerItem, int> ledger,  int riders,  int demand,  double satisfaction,  int budget)?  $default,) {final _that = this;
switch (_that) {
case _DailyReport() when $default != null:
return $default(_that.day,_that.ledger,_that.riders,_that.demand,_that.satisfaction,_that.budget);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReport extends DailyReport {
  const _DailyReport({required this.day, required  Map<LedgerItem, int> ledger, required this.riders, required this.demand, required this.satisfaction, required this.budget}): _ledger = ledger,super._();
  factory _DailyReport.fromJson(Map<String, dynamic> json) => _$DailyReportFromJson(json);

@override final  int day;
 final  Map<LedgerItem, int> _ledger;
@override Map<LedgerItem, int> get ledger {
  if (_ledger is EqualUnmodifiableMapView) return _ledger;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ledger);
}

@override final  int riders;
@override final  int demand;
@override final  double satisfaction;
@override final  int budget;

/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportCopyWith<_DailyReport> get copyWith => __$DailyReportCopyWithImpl<_DailyReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReport&&(identical(other.day, day) || other.day == day)&&const DeepCollectionEquality().equals(other.ledger, _ledger)&&(identical(other.riders, riders) || other.riders == riders)&&(identical(other.demand, demand) || other.demand == demand)&&(identical(other.satisfaction, satisfaction) || other.satisfaction == satisfaction)&&(identical(other.budget, budget) || other.budget == budget));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,day,const DeepCollectionEquality().hash(_ledger),riders,demand,satisfaction,budget);
}

@override
String toString() {
    return 'DailyReport(day: $day, ledger: $ledger, riders: $riders, demand: $demand, satisfaction: $satisfaction, budget: $budget)';
}


}

/// @nodoc
abstract mixin class _$DailyReportCopyWith<$Res> implements $DailyReportCopyWith<$Res> {
  factory _$DailyReportCopyWith(_DailyReport value, $Res Function(_DailyReport) _then) = __$DailyReportCopyWithImpl;
@override @useResult
$Res call({
 int day, Map<LedgerItem, int> ledger, int riders, int demand, double satisfaction, int budget
});




}
/// @nodoc
class __$DailyReportCopyWithImpl<$Res>
    implements _$DailyReportCopyWith<$Res> {
  __$DailyReportCopyWithImpl(this._self, this._then);

  final _DailyReport _self;
  final $Res Function(_DailyReport) _then;

/// Create a copy of DailyReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? ledger = null,Object? riders = null,Object? demand = null,Object? satisfaction = null,Object? budget = null,}) {
  return _then(_DailyReport(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,ledger: null == ledger ? _self._ledger : ledger // ignore: cast_nullable_to_non_nullable
as Map<LedgerItem, int>,riders: null == riders ? _self.riders : riders // ignore: cast_nullable_to_non_nullable
as int,demand: null == demand ? _self.demand : demand // ignore: cast_nullable_to_non_nullable
as int,satisfaction: null == satisfaction ? _self.satisfaction : satisfaction // ignore: cast_nullable_to_non_nullable
as double,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
