import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/settings/application/settings_controller.dart';
import 'package:transport_minister/features/settings/presentation/settings_screen.dart';
import 'package:transport_minister/features/sound/data/local_sound_settings_repository.dart';
import 'package:transport_minister/features/sound/domain/sound_settings.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  late InMemoryDocumentStore store;

  setUp(() => store = InMemoryDocumentStore());

  test('sound settings are remembered on the phone', () async {
    final repository = LocalSoundSettingsRepository(store);
    const settings = SoundSettings(
      music: SoundLevel(enabled: false, volume: 0.2),
      city: SoundLevel(volume: 0.9),
    );

    expect(await repository.load(), isNull);

    await repository.save(settings);

    expect(await repository.load(), settings);
  });

  testWidgets('the settings screen turns music off and remembers it', (tester) async {
    await pumpGameScreen(
      tester,
      const SettingsScreen(),
      store: store,
      now: FakeNow(DateTime(2026, 11, 13, 9)),
      overrides: [appVersionProvider.overrideWith((ref) async => '0.1.0')],
    );
    await tester.scrollUntilVisible(find.text('City sounds'), 200);
    await tester.pumpAndSettle();

    expect(find.text('Sound'), findsOneWidget);
    expect(find.text('Music'), findsOneWidget);
    expect(find.text('Sound effects'), findsOneWidget);
    expect(find.byType(Slider), findsNWidgets(3));

    await tester.tap(find.byType(Switch).first);
    await tester.pumpAndSettle();

    final saved = await LocalSoundSettingsRepository(store).load();
    expect(saved?.music.enabled, isFalse);
    expect(saved?.effects, const SoundLevel(volume: 0.7));
  });
}
