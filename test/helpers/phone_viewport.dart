import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void usePhoneViewport(WidgetTester tester) {
  tester.view
    ..physicalSize = const Size(1080, 2400)
    ..devicePixelRatio = 2.75;
  addTearDown(tester.view.reset);
}
