// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistrictState {

 DistrictId get id; int get population; double get roadCondition; int get roadLevel; bool get hasBikeLanes; double get bikeAdoption; bool get hasSmartSignals; bool get hasModernStops;
/// Create a copy of DistrictState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistrictStateCopyWith<DistrictState> get copyWith => _$DistrictStateCopyWithImpl<DistrictState>(this as DistrictState, _$identity);

  /// Serializes this DistrictState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DistrictState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistrictState&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.population, _this.population) || other.population == _this.population)&&(identical(other.roadCondition, _this.roadCondition) || other.roadCondition == _this.roadCondition)&&(identical(other.roadLevel, _this.roadLevel) || other.roadLevel == _this.roadLevel)&&(identical(other.hasBikeLanes, _this.hasBikeLanes) || other.hasBikeLanes == _this.hasBikeLanes)&&(identical(other.bikeAdoption, _this.bikeAdoption) || other.bikeAdoption == _this.bikeAdoption)&&(identical(other.hasSmartSignals, _this.hasSmartSignals) || other.hasSmartSignals == _this.hasSmartSignals)&&(identical(other.hasModernStops, _this.hasModernStops) || other.hasModernStops == _this.hasModernStops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DistrictState;
  return Object.hash(runtimeType,_this.id,_this.population,_this.roadCondition,_this.roadLevel,_this.hasBikeLanes,_this.bikeAdoption,_this.hasSmartSignals,_this.hasModernStops);
}

@override
String toString() {
  final _this = this as DistrictState;
  return 'DistrictState(id: ${_this.id}, population: ${_this.population}, roadCondition: ${_this.roadCondition}, roadLevel: ${_this.roadLevel}, hasBikeLanes: ${_this.hasBikeLanes}, bikeAdoption: ${_this.bikeAdoption}, hasSmartSignals: ${_this.hasSmartSignals}, hasModernStops: ${_this.hasModernStops})';
}


}

/// @nodoc
abstract mixin class $DistrictStateCopyWith<$Res>  {
  factory $DistrictStateCopyWith(DistrictState value, $Res Function(DistrictState) _then) = _$DistrictStateCopyWithImpl;
@useResult
$Res call({
 DistrictId id, int population, double roadCondition, int roadLevel, bool hasBikeLanes, double bikeAdoption, bool hasSmartSignals, bool hasModernStops
});




}
/// @nodoc
class _$DistrictStateCopyWithImpl<$Res>
    implements $DistrictStateCopyWith<$Res> {
  _$DistrictStateCopyWithImpl(this._self, this._then);

  final DistrictState _self;
  final $Res Function(DistrictState) _then;

/// Create a copy of DistrictState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? population = null,Object? roadCondition = null,Object? roadLevel = null,Object? hasBikeLanes = null,Object? bikeAdoption = null,Object? hasSmartSignals = null,Object? hasModernStops = null,}) {
  return _then(DistrictState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as DistrictId,population: null == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int,roadCondition: null == roadCondition ? _self.roadCondition : roadCondition // ignore: cast_nullable_to_non_nullable
as double,roadLevel: null == roadLevel ? _self.roadLevel : roadLevel // ignore: cast_nullable_to_non_nullable
as int,hasBikeLanes: null == hasBikeLanes ? _self.hasBikeLanes : hasBikeLanes // ignore: cast_nullable_to_non_nullable
as bool,bikeAdoption: null == bikeAdoption ? _self.bikeAdoption : bikeAdoption // ignore: cast_nullable_to_non_nullable
as double,hasSmartSignals: null == hasSmartSignals ? _self.hasSmartSignals : hasSmartSignals // ignore: cast_nullable_to_non_nullable
as bool,hasModernStops: null == hasModernStops ? _self.hasModernStops : hasModernStops // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DistrictState].
extension DistrictStatePatterns on DistrictState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistrictState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistrictState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistrictState value)  $default,){
final _that = this;
switch (_that) {
case _DistrictState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistrictState value)?  $default,){
final _that = this;
switch (_that) {
case _DistrictState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DistrictId id,  int population,  double roadCondition,  int roadLevel,  bool hasBikeLanes,  double bikeAdoption,  bool hasSmartSignals,  bool hasModernStops)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistrictState() when $default != null:
return $default(_that.id,_that.population,_that.roadCondition,_that.roadLevel,_that.hasBikeLanes,_that.bikeAdoption,_that.hasSmartSignals,_that.hasModernStops);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DistrictId id,  int population,  double roadCondition,  int roadLevel,  bool hasBikeLanes,  double bikeAdoption,  bool hasSmartSignals,  bool hasModernStops)  $default,) {final _that = this;
switch (_that) {
case _DistrictState():
return $default(_that.id,_that.population,_that.roadCondition,_that.roadLevel,_that.hasBikeLanes,_that.bikeAdoption,_that.hasSmartSignals,_that.hasModernStops);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DistrictId id,  int population,  double roadCondition,  int roadLevel,  bool hasBikeLanes,  double bikeAdoption,  bool hasSmartSignals,  bool hasModernStops)?  $default,) {final _that = this;
switch (_that) {
case _DistrictState() when $default != null:
return $default(_that.id,_that.population,_that.roadCondition,_that.roadLevel,_that.hasBikeLanes,_that.bikeAdoption,_that.hasSmartSignals,_that.hasModernStops);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistrictState implements DistrictState {
  const _DistrictState({required this.id, required this.population, required this.roadCondition, required this.roadLevel, this.hasBikeLanes = false, this.bikeAdoption = 0, this.hasSmartSignals = false, this.hasModernStops = false});
  factory _DistrictState.fromJson(Map<String, dynamic> json) => _$DistrictStateFromJson(json);

@override final  DistrictId id;
@override final  int population;
@override final  double roadCondition;
@override final  int roadLevel;
@override@JsonKey() final  bool hasBikeLanes;
@override@JsonKey() final  double bikeAdoption;
@override@JsonKey() final  bool hasSmartSignals;
@override@JsonKey() final  bool hasModernStops;

/// Create a copy of DistrictState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistrictStateCopyWith<_DistrictState> get copyWith => __$DistrictStateCopyWithImpl<_DistrictState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistrictStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistrictState&&(identical(other.id, id) || other.id == id)&&(identical(other.population, population) || other.population == population)&&(identical(other.roadCondition, roadCondition) || other.roadCondition == roadCondition)&&(identical(other.roadLevel, roadLevel) || other.roadLevel == roadLevel)&&(identical(other.hasBikeLanes, hasBikeLanes) || other.hasBikeLanes == hasBikeLanes)&&(identical(other.bikeAdoption, bikeAdoption) || other.bikeAdoption == bikeAdoption)&&(identical(other.hasSmartSignals, hasSmartSignals) || other.hasSmartSignals == hasSmartSignals)&&(identical(other.hasModernStops, hasModernStops) || other.hasModernStops == hasModernStops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,population,roadCondition,roadLevel,hasBikeLanes,bikeAdoption,hasSmartSignals,hasModernStops);
}

@override
String toString() {
    return 'DistrictState(id: $id, population: $population, roadCondition: $roadCondition, roadLevel: $roadLevel, hasBikeLanes: $hasBikeLanes, bikeAdoption: $bikeAdoption, hasSmartSignals: $hasSmartSignals, hasModernStops: $hasModernStops)';
}


}

/// @nodoc
abstract mixin class _$DistrictStateCopyWith<$Res> implements $DistrictStateCopyWith<$Res> {
  factory _$DistrictStateCopyWith(_DistrictState value, $Res Function(_DistrictState) _then) = __$DistrictStateCopyWithImpl;
@override @useResult
$Res call({
 DistrictId id, int population, double roadCondition, int roadLevel, bool hasBikeLanes, double bikeAdoption, bool hasSmartSignals, bool hasModernStops
});




}
/// @nodoc
class __$DistrictStateCopyWithImpl<$Res>
    implements _$DistrictStateCopyWith<$Res> {
  __$DistrictStateCopyWithImpl(this._self, this._then);

  final _DistrictState _self;
  final $Res Function(_DistrictState) _then;

/// Create a copy of DistrictState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? population = null,Object? roadCondition = null,Object? roadLevel = null,Object? hasBikeLanes = null,Object? bikeAdoption = null,Object? hasSmartSignals = null,Object? hasModernStops = null,}) {
  return _then(_DistrictState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as DistrictId,population: null == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int,roadCondition: null == roadCondition ? _self.roadCondition : roadCondition // ignore: cast_nullable_to_non_nullable
as double,roadLevel: null == roadLevel ? _self.roadLevel : roadLevel // ignore: cast_nullable_to_non_nullable
as int,hasBikeLanes: null == hasBikeLanes ? _self.hasBikeLanes : hasBikeLanes // ignore: cast_nullable_to_non_nullable
as bool,bikeAdoption: null == bikeAdoption ? _self.bikeAdoption : bikeAdoption // ignore: cast_nullable_to_non_nullable
as double,hasSmartSignals: null == hasSmartSignals ? _self.hasSmartSignals : hasSmartSignals // ignore: cast_nullable_to_non_nullable
as bool,hasModernStops: null == hasModernStops ? _self.hasModernStops : hasModernStops // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
