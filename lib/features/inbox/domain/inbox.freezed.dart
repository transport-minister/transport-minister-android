// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameNotification {

 int get id; NotificationKind get kind; int get createdAtMs; Map<String, String> get data; bool get read;
/// Create a copy of GameNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameNotificationCopyWith<GameNotification> get copyWith => _$GameNotificationCopyWithImpl<GameNotification>(this as GameNotification, _$identity);

  /// Serializes this GameNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GameNotification;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameNotification&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.createdAtMs, _this.createdAtMs) || other.createdAtMs == _this.createdAtMs)&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.read, _this.read) || other.read == _this.read));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GameNotification;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.createdAtMs,const DeepCollectionEquality().hash(_this.data),_this.read);
}

@override
String toString() {
  final _this = this as GameNotification;
  return 'GameNotification(id: ${_this.id}, kind: ${_this.kind}, createdAtMs: ${_this.createdAtMs}, data: ${_this.data}, read: ${_this.read})';
}


}

/// @nodoc
abstract mixin class $GameNotificationCopyWith<$Res>  {
  factory $GameNotificationCopyWith(GameNotification value, $Res Function(GameNotification) _then) = _$GameNotificationCopyWithImpl;
@useResult
$Res call({
 int id, NotificationKind kind, int createdAtMs, Map<String, String> data, bool read
});




}
/// @nodoc
class _$GameNotificationCopyWithImpl<$Res>
    implements $GameNotificationCopyWith<$Res> {
  _$GameNotificationCopyWithImpl(this._self, this._then);

  final GameNotification _self;
  final $Res Function(GameNotification) _then;

/// Create a copy of GameNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? createdAtMs = null,Object? data = null,Object? read = null,}) {
  return _then(GameNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,createdAtMs: null == createdAtMs ? _self.createdAtMs : createdAtMs // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, String>,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GameNotification].
extension GameNotificationPatterns on GameNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameNotification value)  $default,){
final _that = this;
switch (_that) {
case _GameNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameNotification value)?  $default,){
final _that = this;
switch (_that) {
case _GameNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  NotificationKind kind,  int createdAtMs,  Map<String, String> data,  bool read)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameNotification() when $default != null:
return $default(_that.id,_that.kind,_that.createdAtMs,_that.data,_that.read);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  NotificationKind kind,  int createdAtMs,  Map<String, String> data,  bool read)  $default,) {final _that = this;
switch (_that) {
case _GameNotification():
return $default(_that.id,_that.kind,_that.createdAtMs,_that.data,_that.read);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  NotificationKind kind,  int createdAtMs,  Map<String, String> data,  bool read)?  $default,) {final _that = this;
switch (_that) {
case _GameNotification() when $default != null:
return $default(_that.id,_that.kind,_that.createdAtMs,_that.data,_that.read);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameNotification implements GameNotification {
  const _GameNotification({required this.id, required this.kind, required this.createdAtMs,  Map<String, String> data = const {}, this.read = false}): _data = data;
  factory _GameNotification.fromJson(Map<String, dynamic> json) => _$GameNotificationFromJson(json);

@override final  int id;
@override final  NotificationKind kind;
@override final  int createdAtMs;
 final  Map<String, String> _data;
@override@JsonKey() Map<String, String> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override@JsonKey() final  bool read;

/// Create a copy of GameNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameNotificationCopyWith<_GameNotification> get copyWith => __$GameNotificationCopyWithImpl<_GameNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.createdAtMs, createdAtMs) || other.createdAtMs == createdAtMs)&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.read, read) || other.read == read));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,createdAtMs,const DeepCollectionEquality().hash(_data),read);
}

@override
String toString() {
    return 'GameNotification(id: $id, kind: $kind, createdAtMs: $createdAtMs, data: $data, read: $read)';
}


}

/// @nodoc
abstract mixin class _$GameNotificationCopyWith<$Res> implements $GameNotificationCopyWith<$Res> {
  factory _$GameNotificationCopyWith(_GameNotification value, $Res Function(_GameNotification) _then) = __$GameNotificationCopyWithImpl;
@override @useResult
$Res call({
 int id, NotificationKind kind, int createdAtMs, Map<String, String> data, bool read
});




}
/// @nodoc
class __$GameNotificationCopyWithImpl<$Res>
    implements _$GameNotificationCopyWith<$Res> {
  __$GameNotificationCopyWithImpl(this._self, this._then);

  final _GameNotification _self;
  final $Res Function(_GameNotification) _then;

/// Create a copy of GameNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? createdAtMs = null,Object? data = null,Object? read = null,}) {
  return _then(_GameNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NotificationKind,createdAtMs: null == createdAtMs ? _self.createdAtMs : createdAtMs // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, String>,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Inbox {

 List<GameNotification> get items; int get nextId;
/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxCopyWith<Inbox> get copyWith => _$InboxCopyWithImpl<Inbox>(this as Inbox, _$identity);

  /// Serializes this Inbox to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Inbox;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inbox&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.nextId, _this.nextId) || other.nextId == _this.nextId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Inbox;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.nextId);
}

@override
String toString() {
  final _this = this as Inbox;
  return 'Inbox(items: ${_this.items}, nextId: ${_this.nextId})';
}


}

/// @nodoc
abstract mixin class $InboxCopyWith<$Res>  {
  factory $InboxCopyWith(Inbox value, $Res Function(Inbox) _then) = _$InboxCopyWithImpl;
@useResult
$Res call({
 List<GameNotification> items, int nextId
});




}
/// @nodoc
class _$InboxCopyWithImpl<$Res>
    implements $InboxCopyWith<$Res> {
  _$InboxCopyWithImpl(this._self, this._then);

  final Inbox _self;
  final $Res Function(Inbox) _then;

/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextId = null,}) {
  return _then(Inbox(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<GameNotification>,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Inbox].
extension InboxPatterns on Inbox {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Inbox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inbox() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Inbox value)  $default,){
final _that = this;
switch (_that) {
case _Inbox():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Inbox value)?  $default,){
final _that = this;
switch (_that) {
case _Inbox() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GameNotification> items,  int nextId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inbox() when $default != null:
return $default(_that.items,_that.nextId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GameNotification> items,  int nextId)  $default,) {final _that = this;
switch (_that) {
case _Inbox():
return $default(_that.items,_that.nextId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GameNotification> items,  int nextId)?  $default,) {final _that = this;
switch (_that) {
case _Inbox() when $default != null:
return $default(_that.items,_that.nextId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Inbox extends Inbox {
  const _Inbox({ List<GameNotification> items = const [], this.nextId = 1}): _items = items,super._();
  factory _Inbox.fromJson(Map<String, dynamic> json) => _$InboxFromJson(json);

 final  List<GameNotification> _items;
@override@JsonKey() List<GameNotification> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int nextId;

/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxCopyWith<_Inbox> get copyWith => __$InboxCopyWithImpl<_Inbox>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inbox&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.nextId, nextId) || other.nextId == nextId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextId);
}

@override
String toString() {
    return 'Inbox(items: $items, nextId: $nextId)';
}


}

/// @nodoc
abstract mixin class _$InboxCopyWith<$Res> implements $InboxCopyWith<$Res> {
  factory _$InboxCopyWith(_Inbox value, $Res Function(_Inbox) _then) = __$InboxCopyWithImpl;
@override @useResult
$Res call({
 List<GameNotification> items, int nextId
});




}
/// @nodoc
class __$InboxCopyWithImpl<$Res>
    implements _$InboxCopyWith<$Res> {
  __$InboxCopyWithImpl(this._self, this._then);

  final _Inbox _self;
  final $Res Function(_Inbox) _then;

/// Create a copy of Inbox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextId = null,}) {
  return _then(_Inbox(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<GameNotification>,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
