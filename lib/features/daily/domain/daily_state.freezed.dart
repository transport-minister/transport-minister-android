// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyTask {

 TaskType get type; int get progress; bool get claimed;
/// Create a copy of DailyTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyTaskCopyWith<DailyTask> get copyWith => _$DailyTaskCopyWithImpl<DailyTask>(this as DailyTask, _$identity);

  /// Serializes this DailyTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyTask;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTask&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.claimed, _this.claimed) || other.claimed == _this.claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyTask;
  return Object.hash(runtimeType,_this.type,_this.progress,_this.claimed);
}

@override
String toString() {
  final _this = this as DailyTask;
  return 'DailyTask(type: ${_this.type}, progress: ${_this.progress}, claimed: ${_this.claimed})';
}


}

/// @nodoc
abstract mixin class $DailyTaskCopyWith<$Res>  {
  factory $DailyTaskCopyWith(DailyTask value, $Res Function(DailyTask) _then) = _$DailyTaskCopyWithImpl;
@useResult
$Res call({
 TaskType type, int progress, bool claimed
});




}
/// @nodoc
class _$DailyTaskCopyWithImpl<$Res>
    implements $DailyTaskCopyWith<$Res> {
  _$DailyTaskCopyWithImpl(this._self, this._then);

  final DailyTask _self;
  final $Res Function(DailyTask) _then;

/// Create a copy of DailyTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? progress = null,Object? claimed = null,}) {
  return _then(DailyTask(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyTask].
extension DailyTaskPatterns on DailyTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyTask value)  $default,){
final _that = this;
switch (_that) {
case _DailyTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyTask value)?  $default,){
final _that = this;
switch (_that) {
case _DailyTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TaskType type,  int progress,  bool claimed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyTask() when $default != null:
return $default(_that.type,_that.progress,_that.claimed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TaskType type,  int progress,  bool claimed)  $default,) {final _that = this;
switch (_that) {
case _DailyTask():
return $default(_that.type,_that.progress,_that.claimed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TaskType type,  int progress,  bool claimed)?  $default,) {final _that = this;
switch (_that) {
case _DailyTask() when $default != null:
return $default(_that.type,_that.progress,_that.claimed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyTask extends DailyTask {
  const _DailyTask({required this.type, this.progress = 0, this.claimed = false}): super._();
  factory _DailyTask.fromJson(Map<String, dynamic> json) => _$DailyTaskFromJson(json);

@override final  TaskType type;
@override@JsonKey() final  int progress;
@override@JsonKey() final  bool claimed;

/// Create a copy of DailyTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyTaskCopyWith<_DailyTask> get copyWith => __$DailyTaskCopyWithImpl<_DailyTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyTaskToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyTask&&(identical(other.type, type) || other.type == type)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.claimed, claimed) || other.claimed == claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,progress,claimed);
}

@override
String toString() {
    return 'DailyTask(type: $type, progress: $progress, claimed: $claimed)';
}


}

/// @nodoc
abstract mixin class _$DailyTaskCopyWith<$Res> implements $DailyTaskCopyWith<$Res> {
  factory _$DailyTaskCopyWith(_DailyTask value, $Res Function(_DailyTask) _then) = __$DailyTaskCopyWithImpl;
@override @useResult
$Res call({
 TaskType type, int progress, bool claimed
});




}
/// @nodoc
class __$DailyTaskCopyWithImpl<$Res>
    implements _$DailyTaskCopyWith<$Res> {
  __$DailyTaskCopyWithImpl(this._self, this._then);

  final _DailyTask _self;
  final $Res Function(_DailyTask) _then;

/// Create a copy of DailyTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? progress = null,Object? claimed = null,}) {
  return _then(_DailyTask(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DailyState {

 int get dateKey; List<DailyTask> get tasks; int get streakDays; int get lastStreakKey;
/// Create a copy of DailyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyStateCopyWith<DailyState> get copyWith => _$DailyStateCopyWithImpl<DailyState>(this as DailyState, _$identity);

  /// Serializes this DailyState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyState&&(identical(other.dateKey, _this.dateKey) || other.dateKey == _this.dateKey)&&const DeepCollectionEquality().equals(other.tasks, _this.tasks)&&(identical(other.streakDays, _this.streakDays) || other.streakDays == _this.streakDays)&&(identical(other.lastStreakKey, _this.lastStreakKey) || other.lastStreakKey == _this.lastStreakKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyState;
  return Object.hash(runtimeType,_this.dateKey,const DeepCollectionEquality().hash(_this.tasks),_this.streakDays,_this.lastStreakKey);
}

@override
String toString() {
  final _this = this as DailyState;
  return 'DailyState(dateKey: ${_this.dateKey}, tasks: ${_this.tasks}, streakDays: ${_this.streakDays}, lastStreakKey: ${_this.lastStreakKey})';
}


}

/// @nodoc
abstract mixin class $DailyStateCopyWith<$Res>  {
  factory $DailyStateCopyWith(DailyState value, $Res Function(DailyState) _then) = _$DailyStateCopyWithImpl;
@useResult
$Res call({
 int dateKey, List<DailyTask> tasks, int streakDays, int lastStreakKey
});




}
/// @nodoc
class _$DailyStateCopyWithImpl<$Res>
    implements $DailyStateCopyWith<$Res> {
  _$DailyStateCopyWithImpl(this._self, this._then);

  final DailyState _self;
  final $Res Function(DailyState) _then;

/// Create a copy of DailyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateKey = null,Object? tasks = null,Object? streakDays = null,Object? lastStreakKey = null,}) {
  return _then(DailyState(
dateKey: null == dateKey ? _self.dateKey : dateKey // ignore: cast_nullable_to_non_nullable
as int,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<DailyTask>,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,lastStreakKey: null == lastStreakKey ? _self.lastStreakKey : lastStreakKey // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyState].
extension DailyStatePatterns on DailyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyState value)  $default,){
final _that = this;
switch (_that) {
case _DailyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyState value)?  $default,){
final _that = this;
switch (_that) {
case _DailyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dateKey,  List<DailyTask> tasks,  int streakDays,  int lastStreakKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyState() when $default != null:
return $default(_that.dateKey,_that.tasks,_that.streakDays,_that.lastStreakKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dateKey,  List<DailyTask> tasks,  int streakDays,  int lastStreakKey)  $default,) {final _that = this;
switch (_that) {
case _DailyState():
return $default(_that.dateKey,_that.tasks,_that.streakDays,_that.lastStreakKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dateKey,  List<DailyTask> tasks,  int streakDays,  int lastStreakKey)?  $default,) {final _that = this;
switch (_that) {
case _DailyState() when $default != null:
return $default(_that.dateKey,_that.tasks,_that.streakDays,_that.lastStreakKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyState extends DailyState {
  const _DailyState({this.dateKey = 0,  List<DailyTask> tasks = const [], this.streakDays = 0, this.lastStreakKey = 0}): _tasks = tasks,super._();
  factory _DailyState.fromJson(Map<String, dynamic> json) => _$DailyStateFromJson(json);

@override@JsonKey() final  int dateKey;
 final  List<DailyTask> _tasks;
@override@JsonKey() List<DailyTask> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

@override@JsonKey() final  int streakDays;
@override@JsonKey() final  int lastStreakKey;

/// Create a copy of DailyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyStateCopyWith<_DailyState> get copyWith => __$DailyStateCopyWithImpl<_DailyState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyState&&(identical(other.dateKey, dateKey) || other.dateKey == dateKey)&&const DeepCollectionEquality().equals(other.tasks, _tasks)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.lastStreakKey, lastStreakKey) || other.lastStreakKey == lastStreakKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dateKey,const DeepCollectionEquality().hash(_tasks),streakDays,lastStreakKey);
}

@override
String toString() {
    return 'DailyState(dateKey: $dateKey, tasks: $tasks, streakDays: $streakDays, lastStreakKey: $lastStreakKey)';
}


}

/// @nodoc
abstract mixin class _$DailyStateCopyWith<$Res> implements $DailyStateCopyWith<$Res> {
  factory _$DailyStateCopyWith(_DailyState value, $Res Function(_DailyState) _then) = __$DailyStateCopyWithImpl;
@override @useResult
$Res call({
 int dateKey, List<DailyTask> tasks, int streakDays, int lastStreakKey
});




}
/// @nodoc
class __$DailyStateCopyWithImpl<$Res>
    implements _$DailyStateCopyWith<$Res> {
  __$DailyStateCopyWithImpl(this._self, this._then);

  final _DailyState _self;
  final $Res Function(_DailyState) _then;

/// Create a copy of DailyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateKey = null,Object? tasks = null,Object? streakDays = null,Object? lastStreakKey = null,}) {
  return _then(_DailyState(
dateKey: null == dateKey ? _self.dateKey : dateKey // ignore: cast_nullable_to_non_nullable
as int,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<DailyTask>,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,lastStreakKey: null == lastStreakKey ? _self.lastStreakKey : lastStreakKey // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
