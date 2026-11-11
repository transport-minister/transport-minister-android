import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  testWidgets('the daily gift adds money to the city', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: InMemoryDocumentStore(),
      now: FakeNow(DateTime(2026, 11, 16, 9)),
    );

    await tester.tap(find.byIcon(Icons.task_alt_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Day 1 of 7'), findsOneWidget);

    await tester.tap(find.text(r'Claim $50K'));
    await tester.pumpAndSettle();

    expect(find.text(r'$2.55M'), findsOneWidget);
    expect(find.text('Come back tomorrow for the next gift!'), findsOneWidget);
  });
}
