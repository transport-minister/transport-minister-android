// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CareerStats {

 int get minutesServed; int get busesBought; int get electricBusesBought; int get busUpgrades; int get projectsCompleted; int get roadRepairs; int get crisesAverted; int get dismissals; int get decisionsMade; int get disastersHandled;
/// Create a copy of CareerStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerStatsCopyWith<CareerStats> get copyWith => _$CareerStatsCopyWithImpl<CareerStats>(this as CareerStats, _$identity);

  /// Serializes this CareerStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CareerStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerStats&&(identical(other.minutesServed, _this.minutesServed) || other.minutesServed == _this.minutesServed)&&(identical(other.busesBought, _this.busesBought) || other.busesBought == _this.busesBought)&&(identical(other.electricBusesBought, _this.electricBusesBought) || other.electricBusesBought == _this.electricBusesBought)&&(identical(other.busUpgrades, _this.busUpgrades) || other.busUpgrades == _this.busUpgrades)&&(identical(other.projectsCompleted, _this.projectsCompleted) || other.projectsCompleted == _this.projectsCompleted)&&(identical(other.roadRepairs, _this.roadRepairs) || other.roadRepairs == _this.roadRepairs)&&(identical(other.crisesAverted, _this.crisesAverted) || other.crisesAverted == _this.crisesAverted)&&(identical(other.dismissals, _this.dismissals) || other.dismissals == _this.dismissals)&&(identical(other.decisionsMade, _this.decisionsMade) || other.decisionsMade == _this.decisionsMade)&&(identical(other.disastersHandled, _this.disastersHandled) || other.disastersHandled == _this.disastersHandled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CareerStats;
  return Object.hash(runtimeType,_this.minutesServed,_this.busesBought,_this.electricBusesBought,_this.busUpgrades,_this.projectsCompleted,_this.roadRepairs,_this.crisesAverted,_this.dismissals,_this.decisionsMade,_this.disastersHandled);
}

@override
String toString() {
  final _this = this as CareerStats;
  return 'CareerStats(minutesServed: ${_this.minutesServed}, busesBought: ${_this.busesBought}, electricBusesBought: ${_this.electricBusesBought}, busUpgrades: ${_this.busUpgrades}, projectsCompleted: ${_this.projectsCompleted}, roadRepairs: ${_this.roadRepairs}, crisesAverted: ${_this.crisesAverted}, dismissals: ${_this.dismissals}, decisionsMade: ${_this.decisionsMade}, disastersHandled: ${_this.disastersHandled})';
}


}

/// @nodoc
abstract mixin class $CareerStatsCopyWith<$Res>  {
  factory $CareerStatsCopyWith(CareerStats value, $Res Function(CareerStats) _then) = _$CareerStatsCopyWithImpl;
@useResult
$Res call({
 int minutesServed, int busesBought, int electricBusesBought, int busUpgrades, int projectsCompleted, int roadRepairs, int crisesAverted, int dismissals, int decisionsMade, int disastersHandled
});




}
/// @nodoc
class _$CareerStatsCopyWithImpl<$Res>
    implements $CareerStatsCopyWith<$Res> {
  _$CareerStatsCopyWithImpl(this._self, this._then);

  final CareerStats _self;
  final $Res Function(CareerStats) _then;

/// Create a copy of CareerStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minutesServed = null,Object? busesBought = null,Object? electricBusesBought = null,Object? busUpgrades = null,Object? projectsCompleted = null,Object? roadRepairs = null,Object? crisesAverted = null,Object? dismissals = null,Object? decisionsMade = null,Object? disastersHandled = null,}) {
  return _then(CareerStats(
minutesServed: null == minutesServed ? _self.minutesServed : minutesServed // ignore: cast_nullable_to_non_nullable
as int,busesBought: null == busesBought ? _self.busesBought : busesBought // ignore: cast_nullable_to_non_nullable
as int,electricBusesBought: null == electricBusesBought ? _self.electricBusesBought : electricBusesBought // ignore: cast_nullable_to_non_nullable
as int,busUpgrades: null == busUpgrades ? _self.busUpgrades : busUpgrades // ignore: cast_nullable_to_non_nullable
as int,projectsCompleted: null == projectsCompleted ? _self.projectsCompleted : projectsCompleted // ignore: cast_nullable_to_non_nullable
as int,roadRepairs: null == roadRepairs ? _self.roadRepairs : roadRepairs // ignore: cast_nullable_to_non_nullable
as int,crisesAverted: null == crisesAverted ? _self.crisesAverted : crisesAverted // ignore: cast_nullable_to_non_nullable
as int,dismissals: null == dismissals ? _self.dismissals : dismissals // ignore: cast_nullable_to_non_nullable
as int,decisionsMade: null == decisionsMade ? _self.decisionsMade : decisionsMade // ignore: cast_nullable_to_non_nullable
as int,disastersHandled: null == disastersHandled ? _self.disastersHandled : disastersHandled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CareerStats].
extension CareerStatsPatterns on CareerStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerStats value)  $default,){
final _that = this;
switch (_that) {
case _CareerStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerStats value)?  $default,){
final _that = this;
switch (_that) {
case _CareerStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int minutesServed,  int busesBought,  int electricBusesBought,  int busUpgrades,  int projectsCompleted,  int roadRepairs,  int crisesAverted,  int dismissals,  int decisionsMade,  int disastersHandled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerStats() when $default != null:
return $default(_that.minutesServed,_that.busesBought,_that.electricBusesBought,_that.busUpgrades,_that.projectsCompleted,_that.roadRepairs,_that.crisesAverted,_that.dismissals,_that.decisionsMade,_that.disastersHandled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int minutesServed,  int busesBought,  int electricBusesBought,  int busUpgrades,  int projectsCompleted,  int roadRepairs,  int crisesAverted,  int dismissals,  int decisionsMade,  int disastersHandled)  $default,) {final _that = this;
switch (_that) {
case _CareerStats():
return $default(_that.minutesServed,_that.busesBought,_that.electricBusesBought,_that.busUpgrades,_that.projectsCompleted,_that.roadRepairs,_that.crisesAverted,_that.dismissals,_that.decisionsMade,_that.disastersHandled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int minutesServed,  int busesBought,  int electricBusesBought,  int busUpgrades,  int projectsCompleted,  int roadRepairs,  int crisesAverted,  int dismissals,  int decisionsMade,  int disastersHandled)?  $default,) {final _that = this;
switch (_that) {
case _CareerStats() when $default != null:
return $default(_that.minutesServed,_that.busesBought,_that.electricBusesBought,_that.busUpgrades,_that.projectsCompleted,_that.roadRepairs,_that.crisesAverted,_that.dismissals,_that.decisionsMade,_that.disastersHandled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CareerStats implements CareerStats {
  const _CareerStats({this.minutesServed = 0, this.busesBought = 0, this.electricBusesBought = 0, this.busUpgrades = 0, this.projectsCompleted = 0, this.roadRepairs = 0, this.crisesAverted = 0, this.dismissals = 0, this.decisionsMade = 0, this.disastersHandled = 0});
  factory _CareerStats.fromJson(Map<String, dynamic> json) => _$CareerStatsFromJson(json);

@override@JsonKey() final  int minutesServed;
@override@JsonKey() final  int busesBought;
@override@JsonKey() final  int electricBusesBought;
@override@JsonKey() final  int busUpgrades;
@override@JsonKey() final  int projectsCompleted;
@override@JsonKey() final  int roadRepairs;
@override@JsonKey() final  int crisesAverted;
@override@JsonKey() final  int dismissals;
@override@JsonKey() final  int decisionsMade;
@override@JsonKey() final  int disastersHandled;

/// Create a copy of CareerStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerStatsCopyWith<_CareerStats> get copyWith => __$CareerStatsCopyWithImpl<_CareerStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerStatsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerStats&&(identical(other.minutesServed, minutesServed) || other.minutesServed == minutesServed)&&(identical(other.busesBought, busesBought) || other.busesBought == busesBought)&&(identical(other.electricBusesBought, electricBusesBought) || other.electricBusesBought == electricBusesBought)&&(identical(other.busUpgrades, busUpgrades) || other.busUpgrades == busUpgrades)&&(identical(other.projectsCompleted, projectsCompleted) || other.projectsCompleted == projectsCompleted)&&(identical(other.roadRepairs, roadRepairs) || other.roadRepairs == roadRepairs)&&(identical(other.crisesAverted, crisesAverted) || other.crisesAverted == crisesAverted)&&(identical(other.dismissals, dismissals) || other.dismissals == dismissals)&&(identical(other.decisionsMade, decisionsMade) || other.decisionsMade == decisionsMade)&&(identical(other.disastersHandled, disastersHandled) || other.disastersHandled == disastersHandled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minutesServed,busesBought,electricBusesBought,busUpgrades,projectsCompleted,roadRepairs,crisesAverted,dismissals,decisionsMade,disastersHandled);
}

@override
String toString() {
    return 'CareerStats(minutesServed: $minutesServed, busesBought: $busesBought, electricBusesBought: $electricBusesBought, busUpgrades: $busUpgrades, projectsCompleted: $projectsCompleted, roadRepairs: $roadRepairs, crisesAverted: $crisesAverted, dismissals: $dismissals, decisionsMade: $decisionsMade, disastersHandled: $disastersHandled)';
}


}

/// @nodoc
abstract mixin class _$CareerStatsCopyWith<$Res> implements $CareerStatsCopyWith<$Res> {
  factory _$CareerStatsCopyWith(_CareerStats value, $Res Function(_CareerStats) _then) = __$CareerStatsCopyWithImpl;
@override @useResult
$Res call({
 int minutesServed, int busesBought, int electricBusesBought, int busUpgrades, int projectsCompleted, int roadRepairs, int crisesAverted, int dismissals, int decisionsMade, int disastersHandled
});




}
/// @nodoc
class __$CareerStatsCopyWithImpl<$Res>
    implements _$CareerStatsCopyWith<$Res> {
  __$CareerStatsCopyWithImpl(this._self, this._then);

  final _CareerStats _self;
  final $Res Function(_CareerStats) _then;

/// Create a copy of CareerStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minutesServed = null,Object? busesBought = null,Object? electricBusesBought = null,Object? busUpgrades = null,Object? projectsCompleted = null,Object? roadRepairs = null,Object? crisesAverted = null,Object? dismissals = null,Object? decisionsMade = null,Object? disastersHandled = null,}) {
  return _then(_CareerStats(
minutesServed: null == minutesServed ? _self.minutesServed : minutesServed // ignore: cast_nullable_to_non_nullable
as int,busesBought: null == busesBought ? _self.busesBought : busesBought // ignore: cast_nullable_to_non_nullable
as int,electricBusesBought: null == electricBusesBought ? _self.electricBusesBought : electricBusesBought // ignore: cast_nullable_to_non_nullable
as int,busUpgrades: null == busUpgrades ? _self.busUpgrades : busUpgrades // ignore: cast_nullable_to_non_nullable
as int,projectsCompleted: null == projectsCompleted ? _self.projectsCompleted : projectsCompleted // ignore: cast_nullable_to_non_nullable
as int,roadRepairs: null == roadRepairs ? _self.roadRepairs : roadRepairs // ignore: cast_nullable_to_non_nullable
as int,crisesAverted: null == crisesAverted ? _self.crisesAverted : crisesAverted // ignore: cast_nullable_to_non_nullable
as int,dismissals: null == dismissals ? _self.dismissals : dismissals // ignore: cast_nullable_to_non_nullable
as int,decisionsMade: null == decisionsMade ? _self.decisionsMade : decisionsMade // ignore: cast_nullable_to_non_nullable
as int,disastersHandled: null == disastersHandled ? _self.disastersHandled : disastersHandled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
