import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/simulation/model/pending_decision.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/advisor/presentation/advisor_sheet.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_selection_screen.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/features/diplomacy/presentation/diplomacy_screen.dart';
import 'package:transport_minister/features/inbox/presentation/inbox_screen.dart';
import 'package:transport_minister/features/oath/presentation/oath_screen.dart';
import 'package:transport_minister/features/progression/presentation/profile_screen.dart';
import 'package:transport_minister/features/settings/domain/app_language.dart';
import 'package:transport_minister/features/settings/presentation/settings_screen.dart';
import 'package:transport_minister/features/technology/presentation/technology_screen.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

import '../helpers/fake_now.dart';
import '../helpers/funded_city.dart';
import '../helpers/game_fonts.dart';
import '../helpers/game_screen_harness.dart';

void main() {
  late InMemoryDocumentStore store;
  late FakeNow now;

  setUpAll(loadGameFonts);

  setUp(() async {
    store = InMemoryDocumentStore();
    now = FakeNow(DateTime(2026, 11, 12, 9));
    await saveFundedBaku(store, now);
  });

  void expectWholeTexts() {
    for (final element in find.byType(RichText).evaluate()) {
      final paragraph = element.renderObject! as RenderParagraph;
      expect(paragraph.didExceedMaxLines, isFalse, reason: paragraph.text.toPlainText());
    }
  }

  Future<void> scrollThrough(WidgetTester tester) async {
    expectWholeTexts();
    final scrollables = find.byType(Scrollable);
    if (scrollables.evaluate().isEmpty) {
      return;
    }
    for (var step = 0; step < 12; step++) {
      await tester.drag(scrollables.last, const Offset(0, -300), warnIfMissed: false);
      await tester.pumpAndSettle();
      expectWholeTexts();
    }
  }

  Future<void> saveCity({PendingDecision? decision, CrisisState? crisis}) {
    final city = const BakuScenario().create(seed: 5).copyWith(budget: fundedBudget);
    return LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: city.copyWith(decisions: [?decision], crisis: crisis ?? const CrisisState()),
        anchor: TimeAnchor(syncedAtMs: now.current.millisecondsSinceEpoch),
      ),
    );
  }

  for (final language in AppLanguage.values) {
    final locale = Locale(language.code);
    final l10n = lookupAppLocalizations(locale);

    group(language.code, () {
      Future<void> open(WidgetTester tester, Widget screen) =>
          pumpGameScreen(tester, screen, store: store, now: now, locale: locale);

      testWidgets('the dashboard and every district tab fit', (tester) async {
        await open(tester, const DashboardScreen(cityId: CityId.baku));
        expectWholeTexts();

        await tester.tap(find.text(l10n.levelBarGoal(0, 3).toUpperCase()));
        await tester.pumpAndSettle();
        expectWholeTexts();
        await tester.tapAt(const Offset(200, 40));
        await tester.pumpAndSettle();

        for (final marker in find.byType(DistrictMarker).evaluate().toList()) {
          await tester.tap(find.byWidget(marker.widget));
          await tester.pumpAndSettle();
          for (final tab in [l10n.tabBuses, l10n.tabBuild, l10n.tabMetro]) {
            await tester.tap(find.text(tab).last);
            await tester.pumpAndSettle();
            await scrollThrough(tester);
          }
          await tester.tapAt(const Offset(200, 40));
          await tester.pumpAndSettle();
        }
      });

      testWidgets('news and decisions fit', (tester) async {
        await saveCity(
          decision: const PendingDecision(
            id: 700,
            template: DecisionId.budgetHearing,
            createdTick: 0,
            expiresTick: 90,
          ),
        );
        await open(tester, const DashboardScreen(cityId: CityId.baku));

        await tester.tap(find.byType(MrBusButton));
        await tester.pumpAndSettle();
        await scrollThrough(tester);
      });

      testWidgets('the tutorial and daily tasks fit', (tester) async {
        await pumpGameScreen(
          tester,
          const DashboardScreen(cityId: CityId.baku),
          store: store,
          now: now,
          locale: locale,
          tutorialDone: false,
        );
        for (var step = 0; step < 3; step++) {
          expectWholeTexts();
          await tester.tap(find.text(l10n.tutorialNext));
          await tester.pumpAndSettle();
        }
        await tester.tap(find.text(l10n.tutorialSkip));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.task_alt_rounded));
        await tester.pumpAndSettle();
        await scrollThrough(tester);
      });

      testWidgets('the dismissal screen fits', (tester) async {
        await saveCity(crisis: const CrisisState(seconds: 300, warnings: 3, dismissed: true));
        await open(tester, const DashboardScreen(cityId: CityId.baku));

        expect(find.text(l10n.dismissedTitle), findsOneWidget);
        expectWholeTexts();
      });

      for (final (name, screen) in const [
        ('diplomacy', DiplomacyScreen(cityId: CityId.baku)),
        ('technology', TechnologyScreen(cityId: CityId.baku)),
        ('settings', SettingsScreen()),
        ('profile', ProfileScreen()),
        ('city selection', CitySelectionScreen()),
        ('inbox', InboxScreen()),
        ('oath', OathScreen()),
      ]) {
        testWidgets('the $name screen fits', (tester) async {
          await open(tester, screen);
          await scrollThrough(tester);
        });
      }
    });
  }
}
