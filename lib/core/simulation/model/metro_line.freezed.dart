// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metro_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetroLine {

 DistrictId get from; DistrictId get to; int get totalDays; int get remainingDays;
/// Create a copy of MetroLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetroLineCopyWith<MetroLine> get copyWith => _$MetroLineCopyWithImpl<MetroLine>(this as MetroLine, _$identity);

  /// Serializes this MetroLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MetroLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetroLine&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to)&&(identical(other.totalDays, _this.totalDays) || other.totalDays == _this.totalDays)&&(identical(other.remainingDays, _this.remainingDays) || other.remainingDays == _this.remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MetroLine;
  return Object.hash(runtimeType,_this.from,_this.to,_this.totalDays,_this.remainingDays);
}

@override
String toString() {
  final _this = this as MetroLine;
  return 'MetroLine(from: ${_this.from}, to: ${_this.to}, totalDays: ${_this.totalDays}, remainingDays: ${_this.remainingDays})';
}


}

/// @nodoc
abstract mixin class $MetroLineCopyWith<$Res>  {
  factory $MetroLineCopyWith(MetroLine value, $Res Function(MetroLine) _then) = _$MetroLineCopyWithImpl;
@useResult
$Res call({
 DistrictId from, DistrictId to, int totalDays, int remainingDays
});




}
/// @nodoc
class _$MetroLineCopyWithImpl<$Res>
    implements $MetroLineCopyWith<$Res> {
  _$MetroLineCopyWithImpl(this._self, this._then);

  final MetroLine _self;
  final $Res Function(MetroLine) _then;

/// Create a copy of MetroLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? totalDays = null,Object? remainingDays = null,}) {
  return _then(MetroLine(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DistrictId,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DistrictId,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,remainingDays: null == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MetroLine].
extension MetroLinePatterns on MetroLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetroLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetroLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetroLine value)  $default,){
final _that = this;
switch (_that) {
case _MetroLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetroLine value)?  $default,){
final _that = this;
switch (_that) {
case _MetroLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DistrictId from,  DistrictId to,  int totalDays,  int remainingDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetroLine() when $default != null:
return $default(_that.from,_that.to,_that.totalDays,_that.remainingDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DistrictId from,  DistrictId to,  int totalDays,  int remainingDays)  $default,) {final _that = this;
switch (_that) {
case _MetroLine():
return $default(_that.from,_that.to,_that.totalDays,_that.remainingDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DistrictId from,  DistrictId to,  int totalDays,  int remainingDays)?  $default,) {final _that = this;
switch (_that) {
case _MetroLine() when $default != null:
return $default(_that.from,_that.to,_that.totalDays,_that.remainingDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetroLine extends MetroLine {
  const _MetroLine({required this.from, required this.to, required this.totalDays, required this.remainingDays}): super._();
  factory _MetroLine.fromJson(Map<String, dynamic> json) => _$MetroLineFromJson(json);

@override final  DistrictId from;
@override final  DistrictId to;
@override final  int totalDays;
@override final  int remainingDays;

/// Create a copy of MetroLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetroLineCopyWith<_MetroLine> get copyWith => __$MetroLineCopyWithImpl<_MetroLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetroLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetroLine&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,from,to,totalDays,remainingDays);
}

@override
String toString() {
    return 'MetroLine(from: $from, to: $to, totalDays: $totalDays, remainingDays: $remainingDays)';
}


}

/// @nodoc
abstract mixin class _$MetroLineCopyWith<$Res> implements $MetroLineCopyWith<$Res> {
  factory _$MetroLineCopyWith(_MetroLine value, $Res Function(_MetroLine) _then) = __$MetroLineCopyWithImpl;
@override @useResult
$Res call({
 DistrictId from, DistrictId to, int totalDays, int remainingDays
});




}
/// @nodoc
class __$MetroLineCopyWithImpl<$Res>
    implements _$MetroLineCopyWith<$Res> {
  __$MetroLineCopyWithImpl(this._self, this._then);

  final _MetroLine _self;
  final $Res Function(_MetroLine) _then;

/// Create a copy of MetroLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? totalDays = null,Object? remainingDays = null,}) {
  return _then(_MetroLine(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DistrictId,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DistrictId,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,remainingDays: null == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
