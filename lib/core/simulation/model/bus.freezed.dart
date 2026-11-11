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

 int get id; BusModelId get model; DistrictId get districtId; int get level; int get ageDays; int get deliveryDay;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bus&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.model, _this.model) || other.model == _this.model)&&(identical(other.districtId, _this.districtId) || other.districtId == _this.districtId)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.ageDays, _this.ageDays) || other.ageDays == _this.ageDays)&&(identical(other.deliveryDay, _this.deliveryDay) || other.deliveryDay == _this.deliveryDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Bus;
  return Object.hash(runtimeType,_this.id,_this.model,_this.districtId,_this.level,_this.ageDays,_this.deliveryDay);
}

@override
String toString() {
  final _this = this as Bus;
  return 'Bus(id: ${_this.id}, model: ${_this.model}, districtId: ${_this.districtId}, level: ${_this.level}, ageDays: ${_this.ageDays}, deliveryDay: ${_this.deliveryDay})';
}


}

/// @nodoc
abstract mixin class $BusCopyWith<$Res>  {
  factory $BusCopyWith(Bus value, $Res Function(Bus) _then) = _$BusCopyWithImpl;
@useResult
$Res call({
 int id, BusModelId model, DistrictId districtId, int level, int ageDays, int deliveryDay
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? model = null,Object? districtId = null,Object? level = null,Object? ageDays = null,Object? deliveryDay = null,}) {
  return _then(Bus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as BusModelId,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as DistrictId,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ageDays: null == ageDays ? _self.ageDays : ageDays // ignore: cast_nullable_to_non_nullable
as int,deliveryDay: null == deliveryDay ? _self.deliveryDay : deliveryDay // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  BusModelId model,  DistrictId districtId,  int level,  int ageDays,  int deliveryDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that.id,_that.model,_that.districtId,_that.level,_that.ageDays,_that.deliveryDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  BusModelId model,  DistrictId districtId,  int level,  int ageDays,  int deliveryDay)  $default,) {final _that = this;
switch (_that) {
case _Bus():
return $default(_that.id,_that.model,_that.districtId,_that.level,_that.ageDays,_that.deliveryDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  BusModelId model,  DistrictId districtId,  int level,  int ageDays,  int deliveryDay)?  $default,) {final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that.id,_that.model,_that.districtId,_that.level,_that.ageDays,_that.deliveryDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bus extends Bus {
  const _Bus({required this.id, required this.model, required this.districtId, this.level = 1, this.ageDays = 0, this.deliveryDay = 0}): super._();
  factory _Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

@override final  int id;
@override final  BusModelId model;
@override final  DistrictId districtId;
@override@JsonKey() final  int level;
@override@JsonKey() final  int ageDays;
@override@JsonKey() final  int deliveryDay;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bus&&(identical(other.id, id) || other.id == id)&&(identical(other.model, model) || other.model == model)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.level, level) || other.level == level)&&(identical(other.ageDays, ageDays) || other.ageDays == ageDays)&&(identical(other.deliveryDay, deliveryDay) || other.deliveryDay == deliveryDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,model,districtId,level,ageDays,deliveryDay);
}

@override
String toString() {
    return 'Bus(id: $id, model: $model, districtId: $districtId, level: $level, ageDays: $ageDays, deliveryDay: $deliveryDay)';
}


}

/// @nodoc
abstract mixin class _$BusCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$BusCopyWith(_Bus value, $Res Function(_Bus) _then) = __$BusCopyWithImpl;
@override @useResult
$Res call({
 int id, BusModelId model, DistrictId districtId, int level, int ageDays, int deliveryDay
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? model = null,Object? districtId = null,Object? level = null,Object? ageDays = null,Object? deliveryDay = null,}) {
  return _then(_Bus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as BusModelId,districtId: null == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as DistrictId,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ageDays: null == ageDays ? _self.ageDays : ageDays // ignore: cast_nullable_to_non_nullable
as int,deliveryDay: null == deliveryDay ? _self.deliveryDay : deliveryDay // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
