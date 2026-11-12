// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minister_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MinisterProfile _$MinisterProfileFromJson(Map<String, dynamic> json) => _MinisterProfile(
  xp: (json['xp'] as num?)?.toInt() ?? 0,
  reputation: (json['reputation'] as num?)?.toDouble() ?? 50,
  rank:
      $enumDecodeNullable(_$MinisterialRankEnumMap, json['rank']) ?? MinisterialRank.juniorOfficial,
  bestCityLevels:
      (json['bestCityLevels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$CityIdEnumMap, k), (e as num).toInt()),
      ) ??
      const {},
  achievements:
      (json['achievements'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AchievementIdEnumMap, e))
          .toSet() ??
      const {},
  career: json['career'] == null
      ? const CareerStats()
      : CareerStats.fromJson(json['career'] as Map<String, dynamic>),
  tutorialDone: json['tutorialDone'] as bool? ?? false,
);

Map<String, dynamic> _$MinisterProfileToJson(_MinisterProfile instance) => <String, dynamic>{
  'xp': instance.xp,
  'reputation': instance.reputation,
  'rank': _$MinisterialRankEnumMap[instance.rank]!,
  'bestCityLevels': instance.bestCityLevels.map((k, e) => MapEntry(_$CityIdEnumMap[k]!, e)),
  'achievements': instance.achievements.map((e) => _$AchievementIdEnumMap[e]!).toList(),
  'career': instance.career.toJson(),
  'tutorialDone': instance.tutorialDone,
};

const _$MinisterialRankEnumMap = {
  MinisterialRank.juniorOfficial: 'juniorOfficial',
  MinisterialRank.inspector: 'inspector',
  MinisterialRank.director: 'director',
  MinisterialRank.deputyMinister: 'deputyMinister',
  MinisterialRank.minister: 'minister',
  MinisterialRank.seniorMinister: 'seniorMinister',
  MinisterialRank.regionalGovernor: 'regionalGovernor',
  MinisterialRank.nationalLeader: 'nationalLeader',
  MinisterialRank.internationalAuthority: 'internationalAuthority',
};

const _$CityIdEnumMap = {
  CityId.baku: 'baku',
  CityId.istanbul: 'istanbul',
  CityId.london: 'london',
  CityId.tokyo: 'tokyo',
  CityId.newYork: 'newYork',
};

const _$AchievementIdEnumMap = {
  AchievementId.firstBus: 'firstBus',
  AchievementId.fleetBuilder: 'fleetBuilder',
  AchievementId.modernCity: 'modernCity',
  AchievementId.greenRevolution: 'greenRevolution',
  AchievementId.upgradeEnthusiast: 'upgradeEnthusiast',
  AchievementId.roadWarrior: 'roadWarrior',
  AchievementId.bikeFriendly: 'bikeFriendly',
  AchievementId.infrastructureMaster: 'infrastructureMaster',
  AchievementId.economicStrategist: 'economicStrategist',
  AchievementId.smilingCity: 'smilingCity',
  AchievementId.happyCitizens: 'happyCitizens',
  AchievementId.risingCity: 'risingCity',
  AchievementId.cityChampion: 'cityChampion',
  AchievementId.survivor: 'survivor',
  AchievementId.decisive: 'decisive',
  AchievementId.stormChaser: 'stormChaser',
  AchievementId.innovator: 'innovator',
  AchievementId.veteranMinister: 'veteranMinister',
};
