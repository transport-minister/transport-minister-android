import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => LocalProfileRepository(ref.watch(documentStoreProvider)),
);

final profileProvider = AsyncNotifierProvider<ProfileController, MinisterProfile>(
  ProfileController.new,
);

class ProfileController extends AsyncNotifier<MinisterProfile> {
  @override
  Future<MinisterProfile> build() async =>
      await ref.read(profileRepositoryProvider).load() ?? const MinisterProfile();

  Future<void> recordCityLevel(CityId city, int level) async {
    final profile = await future;
    if (profile.bestLevelIn(city) >= level) {
      return;
    }
    await _save(profile.copyWith(bestCityLevels: {...profile.bestCityLevels, city: level}));
  }

  Future<void> _save(MinisterProfile profile) async {
    state = AsyncData(profile);
    await ref.read(profileRepositoryProvider).save(profile);
  }
}
