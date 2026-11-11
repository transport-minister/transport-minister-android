// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityStats {

 int get busesBought; int get busesSold; int get busUpgrades; int get projectsCompleted; int get positiveBudgetStreak; int get bestPositiveBudgetStreak; int get totalRiders;
/// Create a copy of CityStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityStatsCopyWith<CityStats> get copyWith => _$CityStatsCopyWithImpl<CityStats>(this as CityStats, _$identity);

  /// Serializes this CityStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CityStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityStats&&(identical(other.busesBought, _this.busesBought) || other.busesBought == _this.busesBought)&&(identical(other.busesSold, _this.busesSold) || other.busesSold == _this.busesSold)&&(identical(other.busUpgrades, _this.busUpgrades) || other.busUpgrades == _this.busUpgrades)&&(identical(other.projectsCompleted, _this.projectsCompleted) || other.projectsCompleted == _this.projectsCompleted)&&(identical(other.positiveBudgetStreak, _this.positiveBudgetStreak) || other.positiveBudgetStreak == _this.positiveBudgetStreak)&&(identical(other.bestPositiveBudgetStreak, _this.bestPositiveBudgetStreak) || other.bestPositiveBudgetStreak == _this.bestPositiveBudgetStreak)&&(identical(other.totalRiders, _this.totalRiders) || other.totalRiders == _this.totalRiders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CityStats;
  return Object.hash(runtimeType,_this.busesBought,_this.busesSold,_this.busUpgrades,_this.projectsCompleted,_this.positiveBudgetStreak,_this.bestPositiveBudgetStreak,_this.totalRiders);
}

@override
String toString() {
  final _this = this as CityStats;
  return 'CityStats(busesBought: ${_this.busesBought}, busesSold: ${_this.busesSold}, busUpgrades: ${_this.busUpgrades}, projectsCompleted: ${_this.projectsCompleted}, positiveBudgetStreak: ${_this.positiveBudgetStreak}, bestPositiveBudgetStreak: ${_this.bestPositiveBudgetStreak}, totalRiders: ${_this.totalRiders})';
}


}

/// @nodoc
abstract mixin class $CityStatsCopyWith<$Res>  {
  factory $CityStatsCopyWith(CityStats value, $Res Function(CityStats) _then) = _$CityStatsCopyWithImpl;
@useResult
$Res call({
 int busesBought, int busesSold, int busUpgrades, int projectsCompleted, int positiveBudgetStreak, int bestPositiveBudgetStreak, int totalRiders
});




}
/// @nodoc
class _$CityStatsCopyWithImpl<$Res>
    implements $CityStatsCopyWith<$Res> {
  _$CityStatsCopyWithImpl(this._self, this._then);

  final CityStats _self;
  final $Res Function(CityStats) _then;

/// Create a copy of CityStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? busesBought = null,Object? busesSold = null,Object? busUpgrades = null,Object? projectsCompleted = null,Object? positiveBudgetStreak = null,Object? bestPositiveBudgetStreak = null,Object? totalRiders = null,}) {
  return _then(CityStats(
busesBought: null == busesBought ? _self.busesBought : busesBought // ignore: cast_nullable_to_non_nullable
as int,busesSold: null == busesSold ? _self.busesSold : busesSold // ignore: cast_nullable_to_non_nullable
as int,busUpgrades: null == busUpgrades ? _self.busUpgrades : busUpgrades // ignore: cast_nullable_to_non_nullable
as int,projectsCompleted: null == projectsCompleted ? _self.projectsCompleted : projectsCompleted // ignore: cast_nullable_to_non_nullable
as int,positiveBudgetStreak: null == positiveBudgetStreak ? _self.positiveBudgetStreak : positiveBudgetStreak // ignore: cast_nullable_to_non_nullable
as int,bestPositiveBudgetStreak: null == bestPositiveBudgetStreak ? _self.bestPositiveBudgetStreak : bestPositiveBudgetStreak // ignore: cast_nullable_to_non_nullable
as int,totalRiders: null == totalRiders ? _self.totalRiders : totalRiders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CityStats].
extension CityStatsPatterns on CityStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityStats value)  $default,){
final _that = this;
switch (_that) {
case _CityStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityStats value)?  $default,){
final _that = this;
switch (_that) {
case _CityStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int busesBought,  int busesSold,  int busUpgrades,  int projectsCompleted,  int positiveBudgetStreak,  int bestPositiveBudgetStreak,  int totalRiders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityStats() when $default != null:
return $default(_that.busesBought,_that.busesSold,_that.busUpgrades,_that.projectsCompleted,_that.positiveBudgetStreak,_that.bestPositiveBudgetStreak,_that.totalRiders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int busesBought,  int busesSold,  int busUpgrades,  int projectsCompleted,  int positiveBudgetStreak,  int bestPositiveBudgetStreak,  int totalRiders)  $default,) {final _that = this;
switch (_that) {
case _CityStats():
return $default(_that.busesBought,_that.busesSold,_that.busUpgrades,_that.projectsCompleted,_that.positiveBudgetStreak,_that.bestPositiveBudgetStreak,_that.totalRiders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int busesBought,  int busesSold,  int busUpgrades,  int projectsCompleted,  int positiveBudgetStreak,  int bestPositiveBudgetStreak,  int totalRiders)?  $default,) {final _that = this;
switch (_that) {
case _CityStats() when $default != null:
return $default(_that.busesBought,_that.busesSold,_that.busUpgrades,_that.projectsCompleted,_that.positiveBudgetStreak,_that.bestPositiveBudgetStreak,_that.totalRiders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityStats implements CityStats {
  const _CityStats({this.busesBought = 0, this.busesSold = 0, this.busUpgrades = 0, this.projectsCompleted = 0, this.positiveBudgetStreak = 0, this.bestPositiveBudgetStreak = 0, this.totalRiders = 0});
  factory _CityStats.fromJson(Map<String, dynamic> json) => _$CityStatsFromJson(json);

@override@JsonKey() final  int busesBought;
@override@JsonKey() final  int busesSold;
@override@JsonKey() final  int busUpgrades;
@override@JsonKey() final  int projectsCompleted;
@override@JsonKey() final  int positiveBudgetStreak;
@override@JsonKey() final  int bestPositiveBudgetStreak;
@override@JsonKey() final  int totalRiders;

/// Create a copy of CityStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityStatsCopyWith<_CityStats> get copyWith => __$CityStatsCopyWithImpl<_CityStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityStatsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityStats&&(identical(other.busesBought, busesBought) || other.busesBought == busesBought)&&(identical(other.busesSold, busesSold) || other.busesSold == busesSold)&&(identical(other.busUpgrades, busUpgrades) || other.busUpgrades == busUpgrades)&&(identical(other.projectsCompleted, projectsCompleted) || other.projectsCompleted == projectsCompleted)&&(identical(other.positiveBudgetStreak, positiveBudgetStreak) || other.positiveBudgetStreak == positiveBudgetStreak)&&(identical(other.bestPositiveBudgetStreak, bestPositiveBudgetStreak) || other.bestPositiveBudgetStreak == bestPositiveBudgetStreak)&&(identical(other.totalRiders, totalRiders) || other.totalRiders == totalRiders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,busesBought,busesSold,busUpgrades,projectsCompleted,positiveBudgetStreak,bestPositiveBudgetStreak,totalRiders);
}

@override
String toString() {
    return 'CityStats(busesBought: $busesBought, busesSold: $busesSold, busUpgrades: $busUpgrades, projectsCompleted: $projectsCompleted, positiveBudgetStreak: $positiveBudgetStreak, bestPositiveBudgetStreak: $bestPositiveBudgetStreak, totalRiders: $totalRiders)';
}


}

/// @nodoc
abstract mixin class _$CityStatsCopyWith<$Res> implements $CityStatsCopyWith<$Res> {
  factory _$CityStatsCopyWith(_CityStats value, $Res Function(_CityStats) _then) = __$CityStatsCopyWithImpl;
@override @useResult
$Res call({
 int busesBought, int busesSold, int busUpgrades, int projectsCompleted, int positiveBudgetStreak, int bestPositiveBudgetStreak, int totalRiders
});




}
/// @nodoc
class __$CityStatsCopyWithImpl<$Res>
    implements _$CityStatsCopyWith<$Res> {
  __$CityStatsCopyWithImpl(this._self, this._then);

  final _CityStats _self;
  final $Res Function(_CityStats) _then;

/// Create a copy of CityStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? busesBought = null,Object? busesSold = null,Object? busUpgrades = null,Object? projectsCompleted = null,Object? positiveBudgetStreak = null,Object? bestPositiveBudgetStreak = null,Object? totalRiders = null,}) {
  return _then(_CityStats(
busesBought: null == busesBought ? _self.busesBought : busesBought // ignore: cast_nullable_to_non_nullable
as int,busesSold: null == busesSold ? _self.busesSold : busesSold // ignore: cast_nullable_to_non_nullable
as int,busUpgrades: null == busUpgrades ? _self.busUpgrades : busUpgrades // ignore: cast_nullable_to_non_nullable
as int,projectsCompleted: null == projectsCompleted ? _self.projectsCompleted : projectsCompleted // ignore: cast_nullable_to_non_nullable
as int,positiveBudgetStreak: null == positiveBudgetStreak ? _self.positiveBudgetStreak : positiveBudgetStreak // ignore: cast_nullable_to_non_nullable
as int,bestPositiveBudgetStreak: null == bestPositiveBudgetStreak ? _self.bestPositiveBudgetStreak : bestPositiveBudgetStreak // ignore: cast_nullable_to_non_nullable
as int,totalRiders: null == totalRiders ? _self.totalRiders : totalRiders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
