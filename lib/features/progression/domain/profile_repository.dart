import 'package:transport_minister/features/progression/domain/minister_profile.dart';

abstract interface class ProfileRepository {
  Future<MinisterProfile?> load();

  Future<void> save(MinisterProfile profile);
}
