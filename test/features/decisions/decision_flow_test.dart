import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/pending_decision.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/advisor/presentation/advisor_sheet.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  testWidgets('Mr. Bus brings a decision and the choice takes effect', (tester) async {
    final store = InMemoryDocumentStore();
    final now = FakeNow(DateTime(2026, 11, 11, 8));
    final city = const BakuScenario().create(seed: 1);
    await LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: city.copyWith(
          decisions: const [
            PendingDecision(
              id: 500,
              template: DecisionId.driverWages,
              createdDay: 1,
              expiresDay: 4,
            ),
          ],
        ),
        anchor: TimeAnchor(syncedAtMs: now.current.millisecondsSinceEpoch),
      ),
    );

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );
    await tester.tap(find.byType(MrBusButton));
    await tester.pumpAndSettle();

    expect(find.text('Drivers want a raise'), findsOneWidget);
    expect(find.text('Pay a one-time bonus'), findsOneWidget);

    await tester.ensureVisible(find.text('Choose').at(1));
    await tester.tap(find.text('Choose').at(1));
    await tester.pumpAndSettle();

    expect(find.text('Decision made!'), findsOneWidget);
    expect(find.text(r'$2.44M'), findsOneWidget);
  });
}
