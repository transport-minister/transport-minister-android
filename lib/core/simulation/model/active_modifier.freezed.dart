// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_modifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActiveModifier {

 ModifierType get type; double get value; int get remainingSeconds; DistrictId? get district; StakeholderGroup? get group;
/// Create a copy of ActiveModifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveModifierCopyWith<ActiveModifier> get copyWith => _$ActiveModifierCopyWithImpl<ActiveModifier>(this as ActiveModifier, _$identity);

  /// Serializes this ActiveModifier to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActiveModifier;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveModifier&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.remainingSeconds, _this.remainingSeconds) || other.remainingSeconds == _this.remainingSeconds)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.group, _this.group) || other.group == _this.group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActiveModifier;
  return Object.hash(runtimeType,_this.type,_this.value,_this.remainingSeconds,_this.district,_this.group);
}

@override
String toString() {
  final _this = this as ActiveModifier;
  return 'ActiveModifier(type: ${_this.type}, value: ${_this.value}, remainingSeconds: ${_this.remainingSeconds}, district: ${_this.district}, group: ${_this.group})';
}


}

/// @nodoc
abstract mixin class $ActiveModifierCopyWith<$Res>  {
  factory $ActiveModifierCopyWith(ActiveModifier value, $Res Function(ActiveModifier) _then) = _$ActiveModifierCopyWithImpl;
@useResult
$Res call({
 ModifierType type, double value, int remainingSeconds, DistrictId? district, StakeholderGroup? group
});




}
/// @nodoc
class _$ActiveModifierCopyWithImpl<$Res>
    implements $ActiveModifierCopyWith<$Res> {
  _$ActiveModifierCopyWithImpl(this._self, this._then);

  final ActiveModifier _self;
  final $Res Function(ActiveModifier) _then;

/// Create a copy of ActiveModifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? value = null,Object? remainingSeconds = null,Object? district = freezed,Object? group = freezed,}) {
  return _then(ActiveModifier(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ModifierType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictId?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as StakeholderGroup?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveModifier].
extension ActiveModifierPatterns on ActiveModifier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveModifier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveModifier() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveModifier value)  $default,){
final _that = this;
switch (_that) {
case _ActiveModifier():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveModifier value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveModifier() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ModifierType type,  double value,  int remainingSeconds,  DistrictId? district,  StakeholderGroup? group)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveModifier() when $default != null:
return $default(_that.type,_that.value,_that.remainingSeconds,_that.district,_that.group);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ModifierType type,  double value,  int remainingSeconds,  DistrictId? district,  StakeholderGroup? group)  $default,) {final _that = this;
switch (_that) {
case _ActiveModifier():
return $default(_that.type,_that.value,_that.remainingSeconds,_that.district,_that.group);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ModifierType type,  double value,  int remainingSeconds,  DistrictId? district,  StakeholderGroup? group)?  $default,) {final _that = this;
switch (_that) {
case _ActiveModifier() when $default != null:
return $default(_that.type,_that.value,_that.remainingSeconds,_that.district,_that.group);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveModifier extends ActiveModifier {
  const _ActiveModifier({required this.type, required this.value, required this.remainingSeconds, this.district, this.group}): super._();
  factory _ActiveModifier.fromJson(Map<String, dynamic> json) => _$ActiveModifierFromJson(json);

@override final  ModifierType type;
@override final  double value;
@override final  int remainingSeconds;
@override final  DistrictId? district;
@override final  StakeholderGroup? group;

/// Create a copy of ActiveModifier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveModifierCopyWith<_ActiveModifier> get copyWith => __$ActiveModifierCopyWithImpl<_ActiveModifier>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveModifierToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveModifier&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.district, district) || other.district == district)&&(identical(other.group, group) || other.group == group));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,value,remainingSeconds,district,group);
}

@override
String toString() {
    return 'ActiveModifier(type: $type, value: $value, remainingSeconds: $remainingSeconds, district: $district, group: $group)';
}


}

/// @nodoc
abstract mixin class _$ActiveModifierCopyWith<$Res> implements $ActiveModifierCopyWith<$Res> {
  factory _$ActiveModifierCopyWith(_ActiveModifier value, $Res Function(_ActiveModifier) _then) = __$ActiveModifierCopyWithImpl;
@override @useResult
$Res call({
 ModifierType type, double value, int remainingSeconds, DistrictId? district, StakeholderGroup? group
});




}
/// @nodoc
class __$ActiveModifierCopyWithImpl<$Res>
    implements _$ActiveModifierCopyWith<$Res> {
  __$ActiveModifierCopyWithImpl(this._self, this._then);

  final _ActiveModifier _self;
  final $Res Function(_ActiveModifier) _then;

/// Create a copy of ActiveModifier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? value = null,Object? remainingSeconds = null,Object? district = freezed,Object? group = freezed,}) {
  return _then(_ActiveModifier(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ModifierType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictId?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as StakeholderGroup?,
  ));
}


}

// dart format on
