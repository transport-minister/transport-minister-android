import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/app/transport_minister_app.dart';

void main() {
  testWidgets('starts on the splash screen with the game title', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: TransportMinisterApp()));
    await tester.pumpAndSettle();

    expect(find.text('Transport Minister'), findsOneWidget);
    expect(find.text('Move the city. Win the people.'), findsOneWidget);
  });
}
