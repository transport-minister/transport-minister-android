// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sound_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SoundLevel {

 bool get enabled; double get volume;
/// Create a copy of SoundLevel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SoundLevelCopyWith<SoundLevel> get copyWith => _$SoundLevelCopyWithImpl<SoundLevel>(this as SoundLevel, _$identity);

  /// Serializes this SoundLevel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SoundLevel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SoundLevel&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.volume, _this.volume) || other.volume == _this.volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SoundLevel;
  return Object.hash(runtimeType,_this.enabled,_this.volume);
}

@override
String toString() {
  final _this = this as SoundLevel;
  return 'SoundLevel(enabled: ${_this.enabled}, volume: ${_this.volume})';
}


}

/// @nodoc
abstract mixin class $SoundLevelCopyWith<$Res>  {
  factory $SoundLevelCopyWith(SoundLevel value, $Res Function(SoundLevel) _then) = _$SoundLevelCopyWithImpl;
@useResult
$Res call({
 bool enabled, double volume
});




}
/// @nodoc
class _$SoundLevelCopyWithImpl<$Res>
    implements $SoundLevelCopyWith<$Res> {
  _$SoundLevelCopyWithImpl(this._self, this._then);

  final SoundLevel _self;
  final $Res Function(SoundLevel) _then;

/// Create a copy of SoundLevel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? volume = null,}) {
  return _then(SoundLevel(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SoundLevel].
extension SoundLevelPatterns on SoundLevel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SoundLevel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SoundLevel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SoundLevel value)  $default,){
final _that = this;
switch (_that) {
case _SoundLevel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SoundLevel value)?  $default,){
final _that = this;
switch (_that) {
case _SoundLevel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  double volume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SoundLevel() when $default != null:
return $default(_that.enabled,_that.volume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  double volume)  $default,) {final _that = this;
switch (_that) {
case _SoundLevel():
return $default(_that.enabled,_that.volume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  double volume)?  $default,) {final _that = this;
switch (_that) {
case _SoundLevel() when $default != null:
return $default(_that.enabled,_that.volume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SoundLevel extends SoundLevel {
  const _SoundLevel({this.enabled = true, required this.volume}): super._();
  factory _SoundLevel.fromJson(Map<String, dynamic> json) => _$SoundLevelFromJson(json);

@override@JsonKey() final  bool enabled;
@override final  double volume;

/// Create a copy of SoundLevel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SoundLevelCopyWith<_SoundLevel> get copyWith => __$SoundLevelCopyWithImpl<_SoundLevel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SoundLevelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SoundLevel&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,enabled,volume);
}

@override
String toString() {
    return 'SoundLevel(enabled: $enabled, volume: $volume)';
}


}

/// @nodoc
abstract mixin class _$SoundLevelCopyWith<$Res> implements $SoundLevelCopyWith<$Res> {
  factory _$SoundLevelCopyWith(_SoundLevel value, $Res Function(_SoundLevel) _then) = __$SoundLevelCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, double volume
});




}
/// @nodoc
class __$SoundLevelCopyWithImpl<$Res>
    implements _$SoundLevelCopyWith<$Res> {
  __$SoundLevelCopyWithImpl(this._self, this._then);

  final _SoundLevel _self;
  final $Res Function(_SoundLevel) _then;

/// Create a copy of SoundLevel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? volume = null,}) {
  return _then(_SoundLevel(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SoundSettings {

 SoundLevel get music; SoundLevel get effects; SoundLevel get city;
/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SoundSettingsCopyWith<SoundSettings> get copyWith => _$SoundSettingsCopyWithImpl<SoundSettings>(this as SoundSettings, _$identity);

  /// Serializes this SoundSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SoundSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SoundSettings&&(identical(other.music, _this.music) || other.music == _this.music)&&(identical(other.effects, _this.effects) || other.effects == _this.effects)&&(identical(other.city, _this.city) || other.city == _this.city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SoundSettings;
  return Object.hash(runtimeType,_this.music,_this.effects,_this.city);
}

@override
String toString() {
  final _this = this as SoundSettings;
  return 'SoundSettings(music: ${_this.music}, effects: ${_this.effects}, city: ${_this.city})';
}


}

/// @nodoc
abstract mixin class $SoundSettingsCopyWith<$Res>  {
  factory $SoundSettingsCopyWith(SoundSettings value, $Res Function(SoundSettings) _then) = _$SoundSettingsCopyWithImpl;
@useResult
$Res call({
 SoundLevel music, SoundLevel effects, SoundLevel city
});


$SoundLevelCopyWith<$Res> get music;$SoundLevelCopyWith<$Res> get effects;$SoundLevelCopyWith<$Res> get city;

}
/// @nodoc
class _$SoundSettingsCopyWithImpl<$Res>
    implements $SoundSettingsCopyWith<$Res> {
  _$SoundSettingsCopyWithImpl(this._self, this._then);

  final SoundSettings _self;
  final $Res Function(SoundSettings) _then;

/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? music = null,Object? effects = null,Object? city = null,}) {
  return _then(SoundSettings(
music: null == music ? _self.music : music // ignore: cast_nullable_to_non_nullable
as SoundLevel,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as SoundLevel,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as SoundLevel,
  ));
}
/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoundLevelCopyWith<$Res> get music {
  
  return $SoundLevelCopyWith<$Res>(_self.music, (value) {
    return _then(_self.copyWith(music: value));
  });
}/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoundLevelCopyWith<$Res> get effects {
  
  return $SoundLevelCopyWith<$Res>(_self.effects, (value) {
    return _then(_self.copyWith(effects: value));
  });
}/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoundLevelCopyWith<$Res> get city {
  
  return $SoundLevelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [SoundSettings].
extension SoundSettingsPatterns on SoundSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SoundSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SoundSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SoundSettings value)  $default,){
final _that = this;
switch (_that) {
case _SoundSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SoundSettings value)?  $default,){
final _that = this;
switch (_that) {
case _SoundSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SoundLevel music,  SoundLevel effects,  SoundLevel city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SoundSettings() when $default != null:
return $default(_that.music,_that.effects,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SoundLevel music,  SoundLevel effects,  SoundLevel city)  $default,) {final _that = this;
switch (_that) {
case _SoundSettings():
return $default(_that.music,_that.effects,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SoundLevel music,  SoundLevel effects,  SoundLevel city)?  $default,) {final _that = this;
switch (_that) {
case _SoundSettings() when $default != null:
return $default(_that.music,_that.effects,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SoundSettings extends SoundSettings {
  const _SoundSettings({this.music = const SoundLevel(volume: 0.5), this.effects = const SoundLevel(volume: 0.7), this.city = const SoundLevel(volume: 0.5)}): super._();
  factory _SoundSettings.fromJson(Map<String, dynamic> json) => _$SoundSettingsFromJson(json);

@override@JsonKey() final  SoundLevel music;
@override@JsonKey() final  SoundLevel effects;
@override@JsonKey() final  SoundLevel city;

/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SoundSettingsCopyWith<_SoundSettings> get copyWith => __$SoundSettingsCopyWithImpl<_SoundSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SoundSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SoundSettings&&(identical(other.music, music) || other.music == music)&&(identical(other.effects, effects) || other.effects == effects)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,music,effects,city);
}

@override
String toString() {
    return 'SoundSettings(music: $music, effects: $effects, city: $city)';
}


}

/// @nodoc
abstract mixin class _$SoundSettingsCopyWith<$Res> implements $SoundSettingsCopyWith<$Res> {
  factory _$SoundSettingsCopyWith(_SoundSettings value, $Res Function(_SoundSettings) _then) = __$SoundSettingsCopyWithImpl;
@override @useResult
$Res call({
 SoundLevel music, SoundLevel effects, SoundLevel city
});


@override $SoundLevelCopyWith<$Res> get music;@override $SoundLevelCopyWith<$Res> get effects;@override $SoundLevelCopyWith<$Res> get city;

}
/// @nodoc
class __$SoundSettingsCopyWithImpl<$Res>
    implements _$SoundSettingsCopyWith<$Res> {
  __$SoundSettingsCopyWithImpl(this._self, this._then);

  final _SoundSettings _self;
  final $Res Function(_SoundSettings) _then;

/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? music = null,Object? effects = null,Object? city = null,}) {
  return _then(_SoundSettings(
music: null == music ? _self.music : music // ignore: cast_nullable_to_non_nullable
as SoundLevel,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as SoundLevel,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as SoundLevel,
  ));
}

/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoundLevelCopyWith<$Res> get music {
  
  return $SoundLevelCopyWith<$Res>(_self.music, (value) {
    return _then(_self.copyWith(music: value));
  });
}/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoundLevelCopyWith<$Res> get effects {
  
  return $SoundLevelCopyWith<$Res>(_self.effects, (value) {
    return _then(_self.copyWith(effects: value));
  });
}/// Create a copy of SoundSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoundLevelCopyWith<$Res> get city {
  
  return $SoundLevelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

// dart format on
