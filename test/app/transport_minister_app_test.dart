import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/app/transport_minister_app.dart';
import 'package:transport_minister/core/design/widgets/sticker_text.dart';

import '../helpers/phone_viewport.dart';

Finder _sticker(String text) {
  return find.byWidgetPredicate((widget) => widget is StickerText && widget.text == text);
}

void main() {
  testWidgets('shows the splash and then the city selection', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(const ProviderScope(child: TransportMinisterApp()));
    await tester.pump(const Duration(milliseconds: 1200));

    expect(_sticker('Transport'), findsOneWidget);
    expect(_sticker('Minister'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Choose your city'), findsOneWidget);
    expect(find.text('Baku'), findsOneWidget);
  });

  testWidgets('tapping the splash skips to the city selection', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(const ProviderScope(child: TransportMinisterApp()));
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tapAt(const Offset(200, 400));
    await tester.pumpAndSettle();

    expect(find.text('Choose your city'), findsOneWidget);
  });
}
