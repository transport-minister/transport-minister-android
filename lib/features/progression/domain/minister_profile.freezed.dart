// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'minister_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MinisterProfile {

 Map<CityId, int> get bestCityLevels;
/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinisterProfileCopyWith<MinisterProfile> get copyWith => _$MinisterProfileCopyWithImpl<MinisterProfile>(this as MinisterProfile, _$identity);

  /// Serializes this MinisterProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MinisterProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinisterProfile&&const DeepCollectionEquality().equals(other.bestCityLevels, _this.bestCityLevels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MinisterProfile;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.bestCityLevels));
}

@override
String toString() {
  final _this = this as MinisterProfile;
  return 'MinisterProfile(bestCityLevels: ${_this.bestCityLevels})';
}


}

/// @nodoc
abstract mixin class $MinisterProfileCopyWith<$Res>  {
  factory $MinisterProfileCopyWith(MinisterProfile value, $Res Function(MinisterProfile) _then) = _$MinisterProfileCopyWithImpl;
@useResult
$Res call({
 Map<CityId, int> bestCityLevels
});




}
/// @nodoc
class _$MinisterProfileCopyWithImpl<$Res>
    implements $MinisterProfileCopyWith<$Res> {
  _$MinisterProfileCopyWithImpl(this._self, this._then);

  final MinisterProfile _self;
  final $Res Function(MinisterProfile) _then;

/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bestCityLevels = null,}) {
  return _then(MinisterProfile(
bestCityLevels: null == bestCityLevels ? _self.bestCityLevels : bestCityLevels // ignore: cast_nullable_to_non_nullable
as Map<CityId, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [MinisterProfile].
extension MinisterProfilePatterns on MinisterProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinisterProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinisterProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinisterProfile value)  $default,){
final _that = this;
switch (_that) {
case _MinisterProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinisterProfile value)?  $default,){
final _that = this;
switch (_that) {
case _MinisterProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<CityId, int> bestCityLevels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinisterProfile() when $default != null:
return $default(_that.bestCityLevels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<CityId, int> bestCityLevels)  $default,) {final _that = this;
switch (_that) {
case _MinisterProfile():
return $default(_that.bestCityLevels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<CityId, int> bestCityLevels)?  $default,) {final _that = this;
switch (_that) {
case _MinisterProfile() when $default != null:
return $default(_that.bestCityLevels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MinisterProfile extends MinisterProfile {
  const _MinisterProfile({ Map<CityId, int> bestCityLevels = const {}}): _bestCityLevels = bestCityLevels,super._();
  factory _MinisterProfile.fromJson(Map<String, dynamic> json) => _$MinisterProfileFromJson(json);

 final  Map<CityId, int> _bestCityLevels;
@override@JsonKey() Map<CityId, int> get bestCityLevels {
  if (_bestCityLevels is EqualUnmodifiableMapView) return _bestCityLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_bestCityLevels);
}


/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinisterProfileCopyWith<_MinisterProfile> get copyWith => __$MinisterProfileCopyWithImpl<_MinisterProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MinisterProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinisterProfile&&const DeepCollectionEquality().equals(other.bestCityLevels, _bestCityLevels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_bestCityLevels));
}

@override
String toString() {
    return 'MinisterProfile(bestCityLevels: $bestCityLevels)';
}


}

/// @nodoc
abstract mixin class _$MinisterProfileCopyWith<$Res> implements $MinisterProfileCopyWith<$Res> {
  factory _$MinisterProfileCopyWith(_MinisterProfile value, $Res Function(_MinisterProfile) _then) = __$MinisterProfileCopyWithImpl;
@override @useResult
$Res call({
 Map<CityId, int> bestCityLevels
});




}
/// @nodoc
class __$MinisterProfileCopyWithImpl<$Res>
    implements _$MinisterProfileCopyWith<$Res> {
  __$MinisterProfileCopyWithImpl(this._self, this._then);

  final _MinisterProfile _self;
  final $Res Function(_MinisterProfile) _then;

/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bestCityLevels = null,}) {
  return _then(_MinisterProfile(
bestCityLevels: null == bestCityLevels ? _self._bestCityLevels : bestCityLevels // ignore: cast_nullable_to_non_nullable
as Map<CityId, int>,
  ));
}


}

// dart format on
