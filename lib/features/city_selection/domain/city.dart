enum CityId { baku, istanbul, london, tokyo, newYork }

enum CityAccess { playable, comingSoon, locked }

class City {
  const City({required this.id, required this.contentReady, this.unlockAfter});

  final CityId id;
  final bool contentReady;
  final CityId? unlockAfter;

  bool get isPlayable => contentReady && unlockAfter == null;
}
