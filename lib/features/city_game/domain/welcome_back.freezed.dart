// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_back.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WelcomeBack {

 int get awaySeconds; int get earnings;
/// Create a copy of WelcomeBack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeBackCopyWith<WelcomeBack> get copyWith => _$WelcomeBackCopyWithImpl<WelcomeBack>(this as WelcomeBack, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WelcomeBack;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeBack&&(identical(other.awaySeconds, _this.awaySeconds) || other.awaySeconds == _this.awaySeconds)&&(identical(other.earnings, _this.earnings) || other.earnings == _this.earnings));
}


@override
int get hashCode {
  final _this = this as WelcomeBack;
  return Object.hash(runtimeType,_this.awaySeconds,_this.earnings);
}

@override
String toString() {
  final _this = this as WelcomeBack;
  return 'WelcomeBack(awaySeconds: ${_this.awaySeconds}, earnings: ${_this.earnings})';
}


}

/// @nodoc
abstract mixin class $WelcomeBackCopyWith<$Res>  {
  factory $WelcomeBackCopyWith(WelcomeBack value, $Res Function(WelcomeBack) _then) = _$WelcomeBackCopyWithImpl;
@useResult
$Res call({
 int awaySeconds, int earnings
});




}
/// @nodoc
class _$WelcomeBackCopyWithImpl<$Res>
    implements $WelcomeBackCopyWith<$Res> {
  _$WelcomeBackCopyWithImpl(this._self, this._then);

  final WelcomeBack _self;
  final $Res Function(WelcomeBack) _then;

/// Create a copy of WelcomeBack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? awaySeconds = null,Object? earnings = null,}) {
  return _then(WelcomeBack(
awaySeconds: null == awaySeconds ? _self.awaySeconds : awaySeconds // ignore: cast_nullable_to_non_nullable
as int,earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeBack].
extension WelcomeBackPatterns on WelcomeBack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeBack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeBack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeBack value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeBack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeBack value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeBack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int awaySeconds,  int earnings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeBack() when $default != null:
return $default(_that.awaySeconds,_that.earnings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int awaySeconds,  int earnings)  $default,) {final _that = this;
switch (_that) {
case _WelcomeBack():
return $default(_that.awaySeconds,_that.earnings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int awaySeconds,  int earnings)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeBack() when $default != null:
return $default(_that.awaySeconds,_that.earnings);case _:
  return null;

}
}

}

/// @nodoc


class _WelcomeBack implements WelcomeBack {
  const _WelcomeBack({required this.awaySeconds, required this.earnings});
  

@override final  int awaySeconds;
@override final  int earnings;

/// Create a copy of WelcomeBack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeBackCopyWith<_WelcomeBack> get copyWith => __$WelcomeBackCopyWithImpl<_WelcomeBack>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeBack&&(identical(other.awaySeconds, awaySeconds) || other.awaySeconds == awaySeconds)&&(identical(other.earnings, earnings) || other.earnings == earnings));
}


@override
int get hashCode {
    return Object.hash(runtimeType,awaySeconds,earnings);
}

@override
String toString() {
    return 'WelcomeBack(awaySeconds: $awaySeconds, earnings: $earnings)';
}


}

/// @nodoc
abstract mixin class _$WelcomeBackCopyWith<$Res> implements $WelcomeBackCopyWith<$Res> {
  factory _$WelcomeBackCopyWith(_WelcomeBack value, $Res Function(_WelcomeBack) _then) = __$WelcomeBackCopyWithImpl;
@override @useResult
$Res call({
 int awaySeconds, int earnings
});




}
/// @nodoc
class __$WelcomeBackCopyWithImpl<$Res>
    implements _$WelcomeBackCopyWith<$Res> {
  __$WelcomeBackCopyWithImpl(this._self, this._then);

  final _WelcomeBack _self;
  final $Res Function(_WelcomeBack) _then;

/// Create a copy of WelcomeBack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? awaySeconds = null,Object? earnings = null,}) {
  return _then(_WelcomeBack(
awaySeconds: null == awaySeconds ? _self.awaySeconds : awaySeconds // ignore: cast_nullable_to_non_nullable
as int,earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
