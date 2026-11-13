import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';

Widget _host(Widget child) {
  return MaterialApp(
    theme: GameTheme.light(),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  testWidgets('chunky button reports taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(_host(ChunkyButton(label: 'Buy bus', onPressed: () => taps++)));

    await tester.tap(find.text('Buy bus'));
    await tester.pumpAndSettle();

    expect(taps, 1);
  });

  testWidgets('every press reaches the press feedback', (tester) async {
    var feedback = 0;
    var taps = 0;
    await tester.pumpWidget(
      PressFeedback(
        onPress: () => feedback++,
        child: _host(ChunkyButton(label: 'Buy bus', onPressed: () => taps++)),
      ),
    );

    await tester.tap(find.text('Buy bus'));
    await tester.pumpAndSettle();

    expect(feedback, 1);
    expect(taps, 1);
  });

  testWidgets('chunky button without callback is disabled', (tester) async {
    await tester.pumpWidget(_host(const ChunkyButton(label: 'Locked', onPressed: null)));

    final slab = tester.widget<ChunkySlab>(find.byType(ChunkySlab));
    final detector = tester.widget<GestureDetector>(
      find.descendant(of: find.byType(PressableBuilder), matching: find.byType(GestureDetector)),
    );

    expect(slab.palette, ChunkyPalette.stone);
    expect(detector.onTap, isNull);
  });

  testWidgets('pressable card sinks while pressed', (tester) async {
    await tester.pumpWidget(_host(ChunkyCard(onPressed: () {}, child: const Text('Depot'))));
    final before = tester.getTopLeft(find.text('Depot'));

    final gesture = await tester.startGesture(tester.getCenter(find.text('Depot')));
    await tester.pumpAndSettle();
    final pressed = tester.getTopLeft(find.text('Depot'));
    await gesture.up();
    await tester.pumpAndSettle();

    expect(pressed.dy - before.dy, greaterThanOrEqualTo(GameDimens.depth));
    expect(tester.getTopLeft(find.text('Depot')), before);
  });

  testWidgets('a quick tap still visibly presses the button', (tester) async {
    await tester.pumpWidget(_host(ChunkyButton(label: 'Sign', onPressed: () {})));
    final before = tester.getTopLeft(find.text('Sign'));

    await tester.tap(find.text('Sign'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 80));

    expect(tester.widget<ChunkySlab>(find.byType(ChunkySlab)).pressed, isTrue);
    expect(tester.getTopLeft(find.text('Sign')).dy, greaterThan(before.dy));

    await tester.pumpAndSettle();

    expect(tester.widget<ChunkySlab>(find.byType(ChunkySlab)).pressed, isFalse);
    expect(tester.getTopLeft(find.text('Sign')), before);
  });

  testWidgets('stat pill sizes itself to its value', (tester) async {
    await tester.pumpWidget(_host(const StatPill(icon: Icons.star_rounded, value: '1,240')));

    expect(find.text('1,240'), findsOneWidget);
    expect(tester.getSize(find.byType(StatPill)).width, lessThan(200));
  });

  testWidgets('progress bar clamps its value', (tester) async {
    await tester.pumpWidget(
      _host(const SizedBox(width: 200, child: ChunkyProgressBar(value: 1.7))),
    );
    await tester.pumpAndSettle();

    final fill = tester.widget<FractionallySizedBox>(find.byType(FractionallySizedBox));

    expect(fill.widthFactor, 1);
  });
}
