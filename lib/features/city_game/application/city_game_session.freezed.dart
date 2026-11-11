// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_game_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CityGameSession {

 CityState get city; double get dayProgress; AwaySummary? get awaySummary; List<CityEvent> get latestEvents;
/// Create a copy of CityGameSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityGameSessionCopyWith<CityGameSession> get copyWith => _$CityGameSessionCopyWithImpl<CityGameSession>(this as CityGameSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CityGameSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityGameSession&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.dayProgress, _this.dayProgress) || other.dayProgress == _this.dayProgress)&&(identical(other.awaySummary, _this.awaySummary) || other.awaySummary == _this.awaySummary)&&const DeepCollectionEquality().equals(other.latestEvents, _this.latestEvents));
}


@override
int get hashCode {
  final _this = this as CityGameSession;
  return Object.hash(runtimeType,_this.city,_this.dayProgress,_this.awaySummary,const DeepCollectionEquality().hash(_this.latestEvents));
}

@override
String toString() {
  final _this = this as CityGameSession;
  return 'CityGameSession(city: ${_this.city}, dayProgress: ${_this.dayProgress}, awaySummary: ${_this.awaySummary}, latestEvents: ${_this.latestEvents})';
}


}

/// @nodoc
abstract mixin class $CityGameSessionCopyWith<$Res>  {
  factory $CityGameSessionCopyWith(CityGameSession value, $Res Function(CityGameSession) _then) = _$CityGameSessionCopyWithImpl;
@useResult
$Res call({
 CityState city, double dayProgress, AwaySummary? awaySummary, List<CityEvent> latestEvents
});


$CityStateCopyWith<$Res> get city;

}
/// @nodoc
class _$CityGameSessionCopyWithImpl<$Res>
    implements $CityGameSessionCopyWith<$Res> {
  _$CityGameSessionCopyWithImpl(this._self, this._then);

  final CityGameSession _self;
  final $Res Function(CityGameSession) _then;

/// Create a copy of CityGameSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? dayProgress = null,Object? awaySummary = freezed,Object? latestEvents = null,}) {
  return _then(CityGameSession(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityState,dayProgress: null == dayProgress ? _self.dayProgress : dayProgress // ignore: cast_nullable_to_non_nullable
as double,awaySummary: freezed == awaySummary ? _self.awaySummary : awaySummary // ignore: cast_nullable_to_non_nullable
as AwaySummary?,latestEvents: null == latestEvents ? _self.latestEvents : latestEvents // ignore: cast_nullable_to_non_nullable
as List<CityEvent>,
  ));
}
/// Create a copy of CityGameSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityStateCopyWith<$Res> get city {
  
  return $CityStateCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [CityGameSession].
extension CityGameSessionPatterns on CityGameSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityGameSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityGameSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityGameSession value)  $default,){
final _that = this;
switch (_that) {
case _CityGameSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityGameSession value)?  $default,){
final _that = this;
switch (_that) {
case _CityGameSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CityState city,  double dayProgress,  AwaySummary? awaySummary,  List<CityEvent> latestEvents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityGameSession() when $default != null:
return $default(_that.city,_that.dayProgress,_that.awaySummary,_that.latestEvents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CityState city,  double dayProgress,  AwaySummary? awaySummary,  List<CityEvent> latestEvents)  $default,) {final _that = this;
switch (_that) {
case _CityGameSession():
return $default(_that.city,_that.dayProgress,_that.awaySummary,_that.latestEvents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CityState city,  double dayProgress,  AwaySummary? awaySummary,  List<CityEvent> latestEvents)?  $default,) {final _that = this;
switch (_that) {
case _CityGameSession() when $default != null:
return $default(_that.city,_that.dayProgress,_that.awaySummary,_that.latestEvents);case _:
  return null;

}
}

}

/// @nodoc


class _CityGameSession implements CityGameSession {
  const _CityGameSession({required this.city, required this.dayProgress, this.awaySummary,  List<CityEvent> latestEvents = const []}): _latestEvents = latestEvents;
  

@override final  CityState city;
@override final  double dayProgress;
@override final  AwaySummary? awaySummary;
 final  List<CityEvent> _latestEvents;
@override@JsonKey() List<CityEvent> get latestEvents {
  if (_latestEvents is EqualUnmodifiableListView) return _latestEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_latestEvents);
}


/// Create a copy of CityGameSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityGameSessionCopyWith<_CityGameSession> get copyWith => __$CityGameSessionCopyWithImpl<_CityGameSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityGameSession&&(identical(other.city, city) || other.city == city)&&(identical(other.dayProgress, dayProgress) || other.dayProgress == dayProgress)&&(identical(other.awaySummary, awaySummary) || other.awaySummary == awaySummary)&&const DeepCollectionEquality().equals(other.latestEvents, _latestEvents));
}


@override
int get hashCode {
    return Object.hash(runtimeType,city,dayProgress,awaySummary,const DeepCollectionEquality().hash(_latestEvents));
}

@override
String toString() {
    return 'CityGameSession(city: $city, dayProgress: $dayProgress, awaySummary: $awaySummary, latestEvents: $latestEvents)';
}


}

/// @nodoc
abstract mixin class _$CityGameSessionCopyWith<$Res> implements $CityGameSessionCopyWith<$Res> {
  factory _$CityGameSessionCopyWith(_CityGameSession value, $Res Function(_CityGameSession) _then) = __$CityGameSessionCopyWithImpl;
@override @useResult
$Res call({
 CityState city, double dayProgress, AwaySummary? awaySummary, List<CityEvent> latestEvents
});


@override $CityStateCopyWith<$Res> get city;

}
/// @nodoc
class __$CityGameSessionCopyWithImpl<$Res>
    implements _$CityGameSessionCopyWith<$Res> {
  __$CityGameSessionCopyWithImpl(this._self, this._then);

  final _CityGameSession _self;
  final $Res Function(_CityGameSession) _then;

/// Create a copy of CityGameSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? dayProgress = null,Object? awaySummary = freezed,Object? latestEvents = null,}) {
  return _then(_CityGameSession(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityState,dayProgress: null == dayProgress ? _self.dayProgress : dayProgress // ignore: cast_nullable_to_non_nullable
as double,awaySummary: freezed == awaySummary ? _self.awaySummary : awaySummary // ignore: cast_nullable_to_non_nullable
as AwaySummary?,latestEvents: null == latestEvents ? _self._latestEvents : latestEvents // ignore: cast_nullable_to_non_nullable
as List<CityEvent>,
  ));
}

/// Create a copy of CityGameSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityStateCopyWith<$Res> get city {
  
  return $CityStateCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

// dart format on
