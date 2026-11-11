import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';

enum CityId { baku, istanbul, london, tokyo, newYork }

enum CityAvailability { playable, comingSoon, locked }

class City {
  const City({required this.id, required this.availability, this.requiredRank});

  final CityId id;
  final CityAvailability availability;
  final MinisterialRank? requiredRank;

  bool get isPlayable => availability == CityAvailability.playable;
}
