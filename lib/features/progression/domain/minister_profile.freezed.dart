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

 int get xp; double get reputation; MinisterialRank get rank; Map<CityId, int> get bestCityLevels; Set<CityId> get completedCities; Set<AchievementId> get achievements; CareerStats get career; bool get tutorialDone; int get diamonds; Set<DiamondPack> get packsBought; bool get oathTaken;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinisterProfile&&(identical(other.xp, _this.xp) || other.xp == _this.xp)&&(identical(other.reputation, _this.reputation) || other.reputation == _this.reputation)&&(identical(other.rank, _this.rank) || other.rank == _this.rank)&&const DeepCollectionEquality().equals(other.bestCityLevels, _this.bestCityLevels)&&const DeepCollectionEquality().equals(other.completedCities, _this.completedCities)&&const DeepCollectionEquality().equals(other.achievements, _this.achievements)&&(identical(other.career, _this.career) || other.career == _this.career)&&(identical(other.tutorialDone, _this.tutorialDone) || other.tutorialDone == _this.tutorialDone)&&(identical(other.diamonds, _this.diamonds) || other.diamonds == _this.diamonds)&&const DeepCollectionEquality().equals(other.packsBought, _this.packsBought)&&(identical(other.oathTaken, _this.oathTaken) || other.oathTaken == _this.oathTaken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MinisterProfile;
  return Object.hash(runtimeType,_this.xp,_this.reputation,_this.rank,const DeepCollectionEquality().hash(_this.bestCityLevels),const DeepCollectionEquality().hash(_this.completedCities),const DeepCollectionEquality().hash(_this.achievements),_this.career,_this.tutorialDone,_this.diamonds,const DeepCollectionEquality().hash(_this.packsBought),_this.oathTaken);
}

@override
String toString() {
  final _this = this as MinisterProfile;
  return 'MinisterProfile(xp: ${_this.xp}, reputation: ${_this.reputation}, rank: ${_this.rank}, bestCityLevels: ${_this.bestCityLevels}, completedCities: ${_this.completedCities}, achievements: ${_this.achievements}, career: ${_this.career}, tutorialDone: ${_this.tutorialDone}, diamonds: ${_this.diamonds}, packsBought: ${_this.packsBought}, oathTaken: ${_this.oathTaken})';
}


}

/// @nodoc
abstract mixin class $MinisterProfileCopyWith<$Res>  {
  factory $MinisterProfileCopyWith(MinisterProfile value, $Res Function(MinisterProfile) _then) = _$MinisterProfileCopyWithImpl;
@useResult
$Res call({
 int xp, double reputation, MinisterialRank rank, Map<CityId, int> bestCityLevels, Set<CityId> completedCities, Set<AchievementId> achievements, CareerStats career, bool tutorialDone, int diamonds, Set<DiamondPack> packsBought, bool oathTaken
});


$CareerStatsCopyWith<$Res> get career;

}
/// @nodoc
class _$MinisterProfileCopyWithImpl<$Res>
    implements $MinisterProfileCopyWith<$Res> {
  _$MinisterProfileCopyWithImpl(this._self, this._then);

  final MinisterProfile _self;
  final $Res Function(MinisterProfile) _then;

/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xp = null,Object? reputation = null,Object? rank = null,Object? bestCityLevels = null,Object? completedCities = null,Object? achievements = null,Object? career = null,Object? tutorialDone = null,Object? diamonds = null,Object? packsBought = null,Object? oathTaken = null,}) {
  return _then(MinisterProfile(
xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,reputation: null == reputation ? _self.reputation : reputation // ignore: cast_nullable_to_non_nullable
as double,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as MinisterialRank,bestCityLevels: null == bestCityLevels ? _self.bestCityLevels : bestCityLevels // ignore: cast_nullable_to_non_nullable
as Map<CityId, int>,completedCities: null == completedCities ? _self.completedCities : completedCities // ignore: cast_nullable_to_non_nullable
as Set<CityId>,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as Set<AchievementId>,career: null == career ? _self.career : career // ignore: cast_nullable_to_non_nullable
as CareerStats,tutorialDone: null == tutorialDone ? _self.tutorialDone : tutorialDone // ignore: cast_nullable_to_non_nullable
as bool,diamonds: null == diamonds ? _self.diamonds : diamonds // ignore: cast_nullable_to_non_nullable
as int,packsBought: null == packsBought ? _self.packsBought : packsBought // ignore: cast_nullable_to_non_nullable
as Set<DiamondPack>,oathTaken: null == oathTaken ? _self.oathTaken : oathTaken // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerStatsCopyWith<$Res> get career {
  
  return $CareerStatsCopyWith<$Res>(_self.career, (value) {
    return _then(_self.copyWith(career: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int xp,  double reputation,  MinisterialRank rank,  Map<CityId, int> bestCityLevels,  Set<CityId> completedCities,  Set<AchievementId> achievements,  CareerStats career,  bool tutorialDone,  int diamonds,  Set<DiamondPack> packsBought,  bool oathTaken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinisterProfile() when $default != null:
return $default(_that.xp,_that.reputation,_that.rank,_that.bestCityLevels,_that.completedCities,_that.achievements,_that.career,_that.tutorialDone,_that.diamonds,_that.packsBought,_that.oathTaken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int xp,  double reputation,  MinisterialRank rank,  Map<CityId, int> bestCityLevels,  Set<CityId> completedCities,  Set<AchievementId> achievements,  CareerStats career,  bool tutorialDone,  int diamonds,  Set<DiamondPack> packsBought,  bool oathTaken)  $default,) {final _that = this;
switch (_that) {
case _MinisterProfile():
return $default(_that.xp,_that.reputation,_that.rank,_that.bestCityLevels,_that.completedCities,_that.achievements,_that.career,_that.tutorialDone,_that.diamonds,_that.packsBought,_that.oathTaken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int xp,  double reputation,  MinisterialRank rank,  Map<CityId, int> bestCityLevels,  Set<CityId> completedCities,  Set<AchievementId> achievements,  CareerStats career,  bool tutorialDone,  int diamonds,  Set<DiamondPack> packsBought,  bool oathTaken)?  $default,) {final _that = this;
switch (_that) {
case _MinisterProfile() when $default != null:
return $default(_that.xp,_that.reputation,_that.rank,_that.bestCityLevels,_that.completedCities,_that.achievements,_that.career,_that.tutorialDone,_that.diamonds,_that.packsBought,_that.oathTaken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MinisterProfile extends MinisterProfile {
  const _MinisterProfile({this.xp = 0, this.reputation = 50, this.rank = MinisterialRank.juniorOfficial,  Map<CityId, int> bestCityLevels = const {},  Set<CityId> completedCities = const {},  Set<AchievementId> achievements = const {}, this.career = const CareerStats(), this.tutorialDone = false, this.diamonds = 0,  Set<DiamondPack> packsBought = const {}, this.oathTaken = false}): _bestCityLevels = bestCityLevels,_completedCities = completedCities,_achievements = achievements,_packsBought = packsBought,super._();
  factory _MinisterProfile.fromJson(Map<String, dynamic> json) => _$MinisterProfileFromJson(json);

@override@JsonKey() final  int xp;
@override@JsonKey() final  double reputation;
@override@JsonKey() final  MinisterialRank rank;
 final  Map<CityId, int> _bestCityLevels;
@override@JsonKey() Map<CityId, int> get bestCityLevels {
  if (_bestCityLevels is EqualUnmodifiableMapView) return _bestCityLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_bestCityLevels);
}

 final  Set<CityId> _completedCities;
@override@JsonKey() Set<CityId> get completedCities {
  if (_completedCities is EqualUnmodifiableSetView) return _completedCities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_completedCities);
}

 final  Set<AchievementId> _achievements;
@override@JsonKey() Set<AchievementId> get achievements {
  if (_achievements is EqualUnmodifiableSetView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_achievements);
}

@override@JsonKey() final  CareerStats career;
@override@JsonKey() final  bool tutorialDone;
@override@JsonKey() final  int diamonds;
 final  Set<DiamondPack> _packsBought;
@override@JsonKey() Set<DiamondPack> get packsBought {
  if (_packsBought is EqualUnmodifiableSetView) return _packsBought;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_packsBought);
}

@override@JsonKey() final  bool oathTaken;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinisterProfile&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.reputation, reputation) || other.reputation == reputation)&&(identical(other.rank, rank) || other.rank == rank)&&const DeepCollectionEquality().equals(other.bestCityLevels, _bestCityLevels)&&const DeepCollectionEquality().equals(other.completedCities, _completedCities)&&const DeepCollectionEquality().equals(other.achievements, _achievements)&&(identical(other.career, career) || other.career == career)&&(identical(other.tutorialDone, tutorialDone) || other.tutorialDone == tutorialDone)&&(identical(other.diamonds, diamonds) || other.diamonds == diamonds)&&const DeepCollectionEquality().equals(other.packsBought, _packsBought)&&(identical(other.oathTaken, oathTaken) || other.oathTaken == oathTaken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,xp,reputation,rank,const DeepCollectionEquality().hash(_bestCityLevels),const DeepCollectionEquality().hash(_completedCities),const DeepCollectionEquality().hash(_achievements),career,tutorialDone,diamonds,const DeepCollectionEquality().hash(_packsBought),oathTaken);
}

@override
String toString() {
    return 'MinisterProfile(xp: $xp, reputation: $reputation, rank: $rank, bestCityLevels: $bestCityLevels, completedCities: $completedCities, achievements: $achievements, career: $career, tutorialDone: $tutorialDone, diamonds: $diamonds, packsBought: $packsBought, oathTaken: $oathTaken)';
}


}

/// @nodoc
abstract mixin class _$MinisterProfileCopyWith<$Res> implements $MinisterProfileCopyWith<$Res> {
  factory _$MinisterProfileCopyWith(_MinisterProfile value, $Res Function(_MinisterProfile) _then) = __$MinisterProfileCopyWithImpl;
@override @useResult
$Res call({
 int xp, double reputation, MinisterialRank rank, Map<CityId, int> bestCityLevels, Set<CityId> completedCities, Set<AchievementId> achievements, CareerStats career, bool tutorialDone, int diamonds, Set<DiamondPack> packsBought, bool oathTaken
});


@override $CareerStatsCopyWith<$Res> get career;

}
/// @nodoc
class __$MinisterProfileCopyWithImpl<$Res>
    implements _$MinisterProfileCopyWith<$Res> {
  __$MinisterProfileCopyWithImpl(this._self, this._then);

  final _MinisterProfile _self;
  final $Res Function(_MinisterProfile) _then;

/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xp = null,Object? reputation = null,Object? rank = null,Object? bestCityLevels = null,Object? completedCities = null,Object? achievements = null,Object? career = null,Object? tutorialDone = null,Object? diamonds = null,Object? packsBought = null,Object? oathTaken = null,}) {
  return _then(_MinisterProfile(
xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,reputation: null == reputation ? _self.reputation : reputation // ignore: cast_nullable_to_non_nullable
as double,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as MinisterialRank,bestCityLevels: null == bestCityLevels ? _self._bestCityLevels : bestCityLevels // ignore: cast_nullable_to_non_nullable
as Map<CityId, int>,completedCities: null == completedCities ? _self._completedCities : completedCities // ignore: cast_nullable_to_non_nullable
as Set<CityId>,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as Set<AchievementId>,career: null == career ? _self.career : career // ignore: cast_nullable_to_non_nullable
as CareerStats,tutorialDone: null == tutorialDone ? _self.tutorialDone : tutorialDone // ignore: cast_nullable_to_non_nullable
as bool,diamonds: null == diamonds ? _self.diamonds : diamonds // ignore: cast_nullable_to_non_nullable
as int,packsBought: null == packsBought ? _self._packsBought : packsBought // ignore: cast_nullable_to_non_nullable
as Set<DiamondPack>,oathTaken: null == oathTaken ? _self.oathTaken : oathTaken // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MinisterProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerStatsCopyWith<$Res> get career {
  
  return $CareerStatsCopyWith<$Res>(_self.career, (value) {
    return _then(_self.copyWith(career: value));
  });
}
}

// dart format on
