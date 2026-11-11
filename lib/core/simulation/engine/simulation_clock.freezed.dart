// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simulation_clock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeAnchor {

 int get syncedAtMs; int get carriedMs;
/// Create a copy of TimeAnchor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeAnchorCopyWith<TimeAnchor> get copyWith => _$TimeAnchorCopyWithImpl<TimeAnchor>(this as TimeAnchor, _$identity);

  /// Serializes this TimeAnchor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimeAnchor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeAnchor&&(identical(other.syncedAtMs, _this.syncedAtMs) || other.syncedAtMs == _this.syncedAtMs)&&(identical(other.carriedMs, _this.carriedMs) || other.carriedMs == _this.carriedMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimeAnchor;
  return Object.hash(runtimeType,_this.syncedAtMs,_this.carriedMs);
}

@override
String toString() {
  final _this = this as TimeAnchor;
  return 'TimeAnchor(syncedAtMs: ${_this.syncedAtMs}, carriedMs: ${_this.carriedMs})';
}


}

/// @nodoc
abstract mixin class $TimeAnchorCopyWith<$Res>  {
  factory $TimeAnchorCopyWith(TimeAnchor value, $Res Function(TimeAnchor) _then) = _$TimeAnchorCopyWithImpl;
@useResult
$Res call({
 int syncedAtMs, int carriedMs
});




}
/// @nodoc
class _$TimeAnchorCopyWithImpl<$Res>
    implements $TimeAnchorCopyWith<$Res> {
  _$TimeAnchorCopyWithImpl(this._self, this._then);

  final TimeAnchor _self;
  final $Res Function(TimeAnchor) _then;

/// Create a copy of TimeAnchor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? syncedAtMs = null,Object? carriedMs = null,}) {
  return _then(TimeAnchor(
syncedAtMs: null == syncedAtMs ? _self.syncedAtMs : syncedAtMs // ignore: cast_nullable_to_non_nullable
as int,carriedMs: null == carriedMs ? _self.carriedMs : carriedMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeAnchor].
extension TimeAnchorPatterns on TimeAnchor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeAnchor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeAnchor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeAnchor value)  $default,){
final _that = this;
switch (_that) {
case _TimeAnchor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeAnchor value)?  $default,){
final _that = this;
switch (_that) {
case _TimeAnchor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int syncedAtMs,  int carriedMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeAnchor() when $default != null:
return $default(_that.syncedAtMs,_that.carriedMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int syncedAtMs,  int carriedMs)  $default,) {final _that = this;
switch (_that) {
case _TimeAnchor():
return $default(_that.syncedAtMs,_that.carriedMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int syncedAtMs,  int carriedMs)?  $default,) {final _that = this;
switch (_that) {
case _TimeAnchor() when $default != null:
return $default(_that.syncedAtMs,_that.carriedMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeAnchor implements TimeAnchor {
  const _TimeAnchor({required this.syncedAtMs, this.carriedMs = 0});
  factory _TimeAnchor.fromJson(Map<String, dynamic> json) => _$TimeAnchorFromJson(json);

@override final  int syncedAtMs;
@override@JsonKey() final  int carriedMs;

/// Create a copy of TimeAnchor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeAnchorCopyWith<_TimeAnchor> get copyWith => __$TimeAnchorCopyWithImpl<_TimeAnchor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeAnchorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeAnchor&&(identical(other.syncedAtMs, syncedAtMs) || other.syncedAtMs == syncedAtMs)&&(identical(other.carriedMs, carriedMs) || other.carriedMs == carriedMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,syncedAtMs,carriedMs);
}

@override
String toString() {
    return 'TimeAnchor(syncedAtMs: $syncedAtMs, carriedMs: $carriedMs)';
}


}

/// @nodoc
abstract mixin class _$TimeAnchorCopyWith<$Res> implements $TimeAnchorCopyWith<$Res> {
  factory _$TimeAnchorCopyWith(_TimeAnchor value, $Res Function(_TimeAnchor) _then) = __$TimeAnchorCopyWithImpl;
@override @useResult
$Res call({
 int syncedAtMs, int carriedMs
});




}
/// @nodoc
class __$TimeAnchorCopyWithImpl<$Res>
    implements _$TimeAnchorCopyWith<$Res> {
  __$TimeAnchorCopyWithImpl(this._self, this._then);

  final _TimeAnchor _self;
  final $Res Function(_TimeAnchor) _then;

/// Create a copy of TimeAnchor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? syncedAtMs = null,Object? carriedMs = null,}) {
  return _then(_TimeAnchor(
syncedAtMs: null == syncedAtMs ? _self.syncedAtMs : syncedAtMs // ignore: cast_nullable_to_non_nullable
as int,carriedMs: null == carriedMs ? _self.carriedMs : carriedMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
