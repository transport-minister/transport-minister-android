// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bus {

 int get id; BusModelId get model; DistrictId get districtId; int get level; int get ageSeconds; int get deliveryTick;
/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusCopyWith<Bus> get copyWith => _$BusCopyWithImpl<Bus>(this as Bus, _$identity);

  /// Serializes this Bus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Bus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bus&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.model, _this.model) || other.model == _this.model)&&(identical(other.districtId, _this.districtId) || other.districtId == _this.districtId)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.ageSeconds, _this.ageSeconds) || other.ageSeconds == _this.ageSeconds)&&(identical(other.deliveryTick, _this.deliveryTick) || other.deliveryTick == _this.deliveryTick));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Bus;
  return Object.hash(runtimeType,_this.id,_this.model,_this.districtId,_this.level,_this.ageSeconds,_this.deliveryTick);
}

@override
String toString() {
  final _this = this as Bus;
  return 'Bus(id: ${_this.id}, model: ${_this.model}, districtId: ${_this.districtId}, level: ${_this.level}, ageSeconds: ${_this.ageSeconds}, deliveryTick: ${_this.deliveryTick})';
}


}

/// @nodoc
abstract mixin class $BusCopyWith<$Res>  {
  factory $BusCopyWith(Bus value, $Res Function(Bus) _then) = _$BusCopyWithImpl;
@useResult
$Res call({
 int id, BusModelId model, DistrictId districtId, int level, int ageSeconds, int deliveryTick
});




}
/// @nodoc
class _$BusCopyWithImpl<$Res>
    implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._self, this._then);

  final Bus _self;
  final $Res Function(Bus) _then;

/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? model = null,Object? districtId = null,Object? level = null,Object? ageSeconds = null,Object? deliveryTick = null,}) {
  return _then(Bus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as BusModelId,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as DistrictId,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ageSeconds: null == ageSeconds ? _self.ageSeconds : ageSeconds // ignore: cast_nullable_to_non_nullable
as int,deliveryTick: null == deliveryTick ? _self.deliveryTick : deliveryTick // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Bus].
extension BusPatterns on Bus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bus value)  $default,){
final _that = this;
switch (_that) {
case _Bus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bus value)?  $default,){
final _that = this;
switch (_that) {
case _Bus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  BusModelId model,  DistrictId districtId,  int level,  int ageSeconds,  int deliveryTick)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that.id,_that.model,_that.districtId,_that.level,_that.ageSeconds,_that.deliveryTick);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  BusModelId model,  DistrictId districtId,  int level,  int ageSeconds,  int deliveryTick)  $default,) {final _that = this;
switch (_that) {
case _Bus():
return $default(_that.id,_that.model,_that.districtId,_that.level,_that.ageSeconds,_that.deliveryTick);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  BusModelId model,  DistrictId districtId,  int level,  int ageSeconds,  int deliveryTick)?  $default,) {final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that.id,_that.model,_that.districtId,_that.level,_that.ageSeconds,_that.deliveryTick);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bus extends Bus {
  const _Bus({required this.id, required this.model, required this.districtId, this.level = 1, this.ageSeconds = 0, this.deliveryTick = 0}): super._();
  factory _Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

@override final  int id;
@override final  BusModelId model;
@override final  DistrictId districtId;
@override@JsonKey() final  int level;
@override@JsonKey() final  int ageSeconds;
@override@JsonKey() final  int deliveryTick;

/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusCopyWith<_Bus> get copyWith => __$BusCopyWithImpl<_Bus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bus&&(identical(other.id, id) || other.id == id)&&(identical(other.model, model) || other.model == model)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.level, level) || other.level == level)&&(identical(other.ageSeconds, ageSeconds) || other.ageSeconds == ageSeconds)&&(identical(other.deliveryTick, deliveryTick) || other.deliveryTick == deliveryTick));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,model,districtId,level,ageSeconds,deliveryTick);
}

@override
String toString() {
    return 'Bus(id: $id, model: $model, districtId: $districtId, level: $level, ageSeconds: $ageSeconds, deliveryTick: $deliveryTick)';
}


}

/// @nodoc
abstract mixin class _$BusCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$BusCopyWith(_Bus value, $Res Function(_Bus) _then) = __$BusCopyWithImpl;
@override @useResult
$Res call({
 int id, BusModelId model, DistrictId districtId, int level, int ageSeconds, int deliveryTick
});




}
/// @nodoc
class __$BusCopyWithImpl<$Res>
    implements _$BusCopyWith<$Res> {
  __$BusCopyWithImpl(this._self, this._then);

  final _Bus _self;
  final $Res Function(_Bus) _then;

/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? model = null,Object? districtId = null,Object? level = null,Object? ageSeconds = null,Object? deliveryTick = null,}) {
  return _then(_Bus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as BusModelId,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as DistrictId,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ageSeconds: null == ageSeconds ? _self.ageSeconds : ageSeconds // ignore: cast_nullable_to_non_nullable
as int,deliveryTick: null == deliveryTick ? _self.deliveryTick : deliveryTick // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
