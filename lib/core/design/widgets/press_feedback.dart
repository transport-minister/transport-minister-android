import 'package:material_ui/material_ui.dart';

class PressFeedback extends InheritedWidget {
  const PressFeedback({super.key, required this.onPress, required super.child});

  final VoidCallback onPress;

  static VoidCallback? maybeOf(BuildContext context) =>
      context.getInheritedWidgetOfExactType<PressFeedback>()?.onPress;

  @override
  bool updateShouldNotify(PressFeedback oldWidget) => false;
}
