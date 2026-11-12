// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crisis_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CrisisState {

 int get days; int get warnings; bool get dismissed; CrisisCause? get cause;
/// Create a copy of CrisisState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrisisStateCopyWith<CrisisState> get copyWith => _$CrisisStateCopyWithImpl<CrisisState>(this as CrisisState, _$identity);

  /// Serializes this CrisisState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CrisisState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrisisState&&(identical(other.days, _this.days) || other.days == _this.days)&&(identical(other.warnings, _this.warnings) || other.warnings == _this.warnings)&&(identical(other.dismissed, _this.dismissed) || other.dismissed == _this.dismissed)&&(identical(other.cause, _this.cause) || other.cause == _this.cause));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CrisisState;
  return Object.hash(runtimeType,_this.days,_this.warnings,_this.dismissed,_this.cause);
}

@override
String toString() {
  final _this = this as CrisisState;
  return 'CrisisState(days: ${_this.days}, warnings: ${_this.warnings}, dismissed: ${_this.dismissed}, cause: ${_this.cause})';
}


}

/// @nodoc
abstract mixin class $CrisisStateCopyWith<$Res>  {
  factory $CrisisStateCopyWith(CrisisState value, $Res Function(CrisisState) _then) = _$CrisisStateCopyWithImpl;
@useResult
$Res call({
 int days, int warnings, bool dismissed, CrisisCause? cause
});




}
/// @nodoc
class _$CrisisStateCopyWithImpl<$Res>
    implements $CrisisStateCopyWith<$Res> {
  _$CrisisStateCopyWithImpl(this._self, this._then);

  final CrisisState _self;
  final $Res Function(CrisisState) _then;

/// Create a copy of CrisisState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,Object? warnings = null,Object? dismissed = null,Object? cause = freezed,}) {
  return _then(CrisisState(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as int,dismissed: null == dismissed ? _self.dismissed : dismissed // ignore: cast_nullable_to_non_nullable
as bool,cause: freezed == cause ? _self.cause : cause // ignore: cast_nullable_to_non_nullable
as CrisisCause?,
  ));
}

}


/// Adds pattern-matching-related methods to [CrisisState].
extension CrisisStatePatterns on CrisisState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CrisisState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CrisisState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CrisisState value)  $default,){
final _that = this;
switch (_that) {
case _CrisisState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CrisisState value)?  $default,){
final _that = this;
switch (_that) {
case _CrisisState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int days,  int warnings,  bool dismissed,  CrisisCause? cause)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CrisisState() when $default != null:
return $default(_that.days,_that.warnings,_that.dismissed,_that.cause);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int days,  int warnings,  bool dismissed,  CrisisCause? cause)  $default,) {final _that = this;
switch (_that) {
case _CrisisState():
return $default(_that.days,_that.warnings,_that.dismissed,_that.cause);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int days,  int warnings,  bool dismissed,  CrisisCause? cause)?  $default,) {final _that = this;
switch (_that) {
case _CrisisState() when $default != null:
return $default(_that.days,_that.warnings,_that.dismissed,_that.cause);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CrisisState implements CrisisState {
  const _CrisisState({this.days = 0, this.warnings = 0, this.dismissed = false, this.cause});
  factory _CrisisState.fromJson(Map<String, dynamic> json) => _$CrisisStateFromJson(json);

@override@JsonKey() final  int days;
@override@JsonKey() final  int warnings;
@override@JsonKey() final  bool dismissed;
@override final  CrisisCause? cause;

/// Create a copy of CrisisState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CrisisStateCopyWith<_CrisisState> get copyWith => __$CrisisStateCopyWithImpl<_CrisisState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CrisisStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CrisisState&&(identical(other.days, days) || other.days == days)&&(identical(other.warnings, warnings) || other.warnings == warnings)&&(identical(other.dismissed, dismissed) || other.dismissed == dismissed)&&(identical(other.cause, cause) || other.cause == cause));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,days,warnings,dismissed,cause);
}

@override
String toString() {
    return 'CrisisState(days: $days, warnings: $warnings, dismissed: $dismissed, cause: $cause)';
}


}

/// @nodoc
abstract mixin class _$CrisisStateCopyWith<$Res> implements $CrisisStateCopyWith<$Res> {
  factory _$CrisisStateCopyWith(_CrisisState value, $Res Function(_CrisisState) _then) = __$CrisisStateCopyWithImpl;
@override @useResult
$Res call({
 int days, int warnings, bool dismissed, CrisisCause? cause
});




}
/// @nodoc
class __$CrisisStateCopyWithImpl<$Res>
    implements _$CrisisStateCopyWith<$Res> {
  __$CrisisStateCopyWithImpl(this._self, this._then);

  final _CrisisState _self;
  final $Res Function(_CrisisState) _then;

/// Create a copy of CrisisState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? days = null,Object? warnings = null,Object? dismissed = null,Object? cause = freezed,}) {
  return _then(_CrisisState(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as int,dismissed: null == dismissed ? _self.dismissed : dismissed // ignore: cast_nullable_to_non_nullable
as bool,cause: freezed == cause ? _self.cause : cause // ignore: cast_nullable_to_non_nullable
as CrisisCause?,
  ));
}


}

// dart format on
