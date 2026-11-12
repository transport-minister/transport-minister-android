// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_decision.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PendingDecision {

 int get id; DecisionId get template; int get createdTick; int get expiresTick; DistrictId? get district;
/// Create a copy of PendingDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingDecisionCopyWith<PendingDecision> get copyWith => _$PendingDecisionCopyWithImpl<PendingDecision>(this as PendingDecision, _$identity);

  /// Serializes this PendingDecision to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PendingDecision;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingDecision&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.template, _this.template) || other.template == _this.template)&&(identical(other.createdTick, _this.createdTick) || other.createdTick == _this.createdTick)&&(identical(other.expiresTick, _this.expiresTick) || other.expiresTick == _this.expiresTick)&&(identical(other.district, _this.district) || other.district == _this.district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PendingDecision;
  return Object.hash(runtimeType,_this.id,_this.template,_this.createdTick,_this.expiresTick,_this.district);
}

@override
String toString() {
  final _this = this as PendingDecision;
  return 'PendingDecision(id: ${_this.id}, template: ${_this.template}, createdTick: ${_this.createdTick}, expiresTick: ${_this.expiresTick}, district: ${_this.district})';
}


}

/// @nodoc
abstract mixin class $PendingDecisionCopyWith<$Res>  {
  factory $PendingDecisionCopyWith(PendingDecision value, $Res Function(PendingDecision) _then) = _$PendingDecisionCopyWithImpl;
@useResult
$Res call({
 int id, DecisionId template, int createdTick, int expiresTick, DistrictId? district
});




}
/// @nodoc
class _$PendingDecisionCopyWithImpl<$Res>
    implements $PendingDecisionCopyWith<$Res> {
  _$PendingDecisionCopyWithImpl(this._self, this._then);

  final PendingDecision _self;
  final $Res Function(PendingDecision) _then;

/// Create a copy of PendingDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? template = null,Object? createdTick = null,Object? expiresTick = null,Object? district = freezed,}) {
  return _then(PendingDecision(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as DecisionId,createdTick: null == createdTick ? _self.createdTick : createdTick // ignore: cast_nullable_to_non_nullable
as int,expiresTick: null == expiresTick ? _self.expiresTick : expiresTick // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictId?,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingDecision].
extension PendingDecisionPatterns on PendingDecision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingDecision value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingDecision() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingDecision value)  $default,){
final _that = this;
switch (_that) {
case _PendingDecision():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingDecision value)?  $default,){
final _that = this;
switch (_that) {
case _PendingDecision() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DecisionId template,  int createdTick,  int expiresTick,  DistrictId? district)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingDecision() when $default != null:
return $default(_that.id,_that.template,_that.createdTick,_that.expiresTick,_that.district);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DecisionId template,  int createdTick,  int expiresTick,  DistrictId? district)  $default,) {final _that = this;
switch (_that) {
case _PendingDecision():
return $default(_that.id,_that.template,_that.createdTick,_that.expiresTick,_that.district);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DecisionId template,  int createdTick,  int expiresTick,  DistrictId? district)?  $default,) {final _that = this;
switch (_that) {
case _PendingDecision() when $default != null:
return $default(_that.id,_that.template,_that.createdTick,_that.expiresTick,_that.district);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingDecision implements PendingDecision {
  const _PendingDecision({required this.id, required this.template, required this.createdTick, required this.expiresTick, this.district});
  factory _PendingDecision.fromJson(Map<String, dynamic> json) => _$PendingDecisionFromJson(json);

@override final  int id;
@override final  DecisionId template;
@override final  int createdTick;
@override final  int expiresTick;
@override final  DistrictId? district;

/// Create a copy of PendingDecision
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingDecisionCopyWith<_PendingDecision> get copyWith => __$PendingDecisionCopyWithImpl<_PendingDecision>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingDecisionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingDecision&&(identical(other.id, id) || other.id == id)&&(identical(other.template, template) || other.template == template)&&(identical(other.createdTick, createdTick) || other.createdTick == createdTick)&&(identical(other.expiresTick, expiresTick) || other.expiresTick == expiresTick)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,template,createdTick,expiresTick,district);
}

@override
String toString() {
    return 'PendingDecision(id: $id, template: $template, createdTick: $createdTick, expiresTick: $expiresTick, district: $district)';
}


}

/// @nodoc
abstract mixin class _$PendingDecisionCopyWith<$Res> implements $PendingDecisionCopyWith<$Res> {
  factory _$PendingDecisionCopyWith(_PendingDecision value, $Res Function(_PendingDecision) _then) = __$PendingDecisionCopyWithImpl;
@override @useResult
$Res call({
 int id, DecisionId template, int createdTick, int expiresTick, DistrictId? district
});




}
/// @nodoc
class __$PendingDecisionCopyWithImpl<$Res>
    implements _$PendingDecisionCopyWith<$Res> {
  __$PendingDecisionCopyWithImpl(this._self, this._then);

  final _PendingDecision _self;
  final $Res Function(_PendingDecision) _then;

/// Create a copy of PendingDecision
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? template = null,Object? createdTick = null,Object? expiresTick = null,Object? district = freezed,}) {
  return _then(_PendingDecision(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as DecisionId,createdTick: null == createdTick ? _self.createdTick : createdTick // ignore: cast_nullable_to_non_nullable
as int,expiresTick: null == expiresTick ? _self.expiresTick : expiresTick // ignore: cast_nullable_to_non_nullable
as int,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictId?,
  ));
}


}


/// @nodoc
mixin _$DecisionRecord {

 DecisionId get template; int get option; int get tick; bool get riskTriggered; bool get automatic; DistrictId? get district;
/// Create a copy of DecisionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionRecordCopyWith<DecisionRecord> get copyWith => _$DecisionRecordCopyWithImpl<DecisionRecord>(this as DecisionRecord, _$identity);

  /// Serializes this DecisionRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DecisionRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionRecord&&(identical(other.template, _this.template) || other.template == _this.template)&&(identical(other.option, _this.option) || other.option == _this.option)&&(identical(other.tick, _this.tick) || other.tick == _this.tick)&&(identical(other.riskTriggered, _this.riskTriggered) || other.riskTriggered == _this.riskTriggered)&&(identical(other.automatic, _this.automatic) || other.automatic == _this.automatic)&&(identical(other.district, _this.district) || other.district == _this.district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DecisionRecord;
  return Object.hash(runtimeType,_this.template,_this.option,_this.tick,_this.riskTriggered,_this.automatic,_this.district);
}

@override
String toString() {
  final _this = this as DecisionRecord;
  return 'DecisionRecord(template: ${_this.template}, option: ${_this.option}, tick: ${_this.tick}, riskTriggered: ${_this.riskTriggered}, automatic: ${_this.automatic}, district: ${_this.district})';
}


}

/// @nodoc
abstract mixin class $DecisionRecordCopyWith<$Res>  {
  factory $DecisionRecordCopyWith(DecisionRecord value, $Res Function(DecisionRecord) _then) = _$DecisionRecordCopyWithImpl;
@useResult
$Res call({
 DecisionId template, int option, int tick, bool riskTriggered, bool automatic, DistrictId? district
});




}
/// @nodoc
class _$DecisionRecordCopyWithImpl<$Res>
    implements $DecisionRecordCopyWith<$Res> {
  _$DecisionRecordCopyWithImpl(this._self, this._then);

  final DecisionRecord _self;
  final $Res Function(DecisionRecord) _then;

/// Create a copy of DecisionRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? template = null,Object? option = null,Object? tick = null,Object? riskTriggered = null,Object? automatic = null,Object? district = freezed,}) {
  return _then(DecisionRecord(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as DecisionId,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,riskTriggered: null == riskTriggered ? _self.riskTriggered : riskTriggered // ignore: cast_nullable_to_non_nullable
as bool,automatic: null == automatic ? _self.automatic : automatic // ignore: cast_nullable_to_non_nullable
as bool,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictId?,
  ));
}

}


/// Adds pattern-matching-related methods to [DecisionRecord].
extension DecisionRecordPatterns on DecisionRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DecisionRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DecisionRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DecisionRecord value)  $default,){
final _that = this;
switch (_that) {
case _DecisionRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DecisionRecord value)?  $default,){
final _that = this;
switch (_that) {
case _DecisionRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DecisionId template,  int option,  int tick,  bool riskTriggered,  bool automatic,  DistrictId? district)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DecisionRecord() when $default != null:
return $default(_that.template,_that.option,_that.tick,_that.riskTriggered,_that.automatic,_that.district);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DecisionId template,  int option,  int tick,  bool riskTriggered,  bool automatic,  DistrictId? district)  $default,) {final _that = this;
switch (_that) {
case _DecisionRecord():
return $default(_that.template,_that.option,_that.tick,_that.riskTriggered,_that.automatic,_that.district);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DecisionId template,  int option,  int tick,  bool riskTriggered,  bool automatic,  DistrictId? district)?  $default,) {final _that = this;
switch (_that) {
case _DecisionRecord() when $default != null:
return $default(_that.template,_that.option,_that.tick,_that.riskTriggered,_that.automatic,_that.district);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DecisionRecord implements DecisionRecord {
  const _DecisionRecord({required this.template, required this.option, required this.tick, required this.riskTriggered, required this.automatic, this.district});
  factory _DecisionRecord.fromJson(Map<String, dynamic> json) => _$DecisionRecordFromJson(json);

@override final  DecisionId template;
@override final  int option;
@override final  int tick;
@override final  bool riskTriggered;
@override final  bool automatic;
@override final  DistrictId? district;

/// Create a copy of DecisionRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecisionRecordCopyWith<_DecisionRecord> get copyWith => __$DecisionRecordCopyWithImpl<_DecisionRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DecisionRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecisionRecord&&(identical(other.template, template) || other.template == template)&&(identical(other.option, option) || other.option == option)&&(identical(other.tick, tick) || other.tick == tick)&&(identical(other.riskTriggered, riskTriggered) || other.riskTriggered == riskTriggered)&&(identical(other.automatic, automatic) || other.automatic == automatic)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,template,option,tick,riskTriggered,automatic,district);
}

@override
String toString() {
    return 'DecisionRecord(template: $template, option: $option, tick: $tick, riskTriggered: $riskTriggered, automatic: $automatic, district: $district)';
}


}

/// @nodoc
abstract mixin class _$DecisionRecordCopyWith<$Res> implements $DecisionRecordCopyWith<$Res> {
  factory _$DecisionRecordCopyWith(_DecisionRecord value, $Res Function(_DecisionRecord) _then) = __$DecisionRecordCopyWithImpl;
@override @useResult
$Res call({
 DecisionId template, int option, int tick, bool riskTriggered, bool automatic, DistrictId? district
});




}
/// @nodoc
class __$DecisionRecordCopyWithImpl<$Res>
    implements _$DecisionRecordCopyWith<$Res> {
  __$DecisionRecordCopyWithImpl(this._self, this._then);

  final _DecisionRecord _self;
  final $Res Function(_DecisionRecord) _then;

/// Create a copy of DecisionRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? template = null,Object? option = null,Object? tick = null,Object? riskTriggered = null,Object? automatic = null,Object? district = freezed,}) {
  return _then(_DecisionRecord(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as DecisionId,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,riskTriggered: null == riskTriggered ? _self.riskTriggered : riskTriggered // ignore: cast_nullable_to_non_nullable
as bool,automatic: null == automatic ? _self.automatic : automatic // ignore: cast_nullable_to_non_nullable
as bool,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictId?,
  ));
}


}

// dart format on
