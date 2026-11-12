import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';

abstract final class GameTypography {
  static const fontFamily = 'Fredoka';

  static const textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 44, height: 1.05, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(fontSize: 36, height: 1.1, fontWeight: FontWeight.w700),
    displaySmall: TextStyle(fontSize: 30, height: 1.1, fontWeight: FontWeight.w700),
    headlineLarge: TextStyle(fontSize: 28, height: 1.15, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontSize: 24, height: 1.15, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontSize: 21, height: 1.2, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontSize: 19, height: 1.2, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 17, height: 1.25, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 15, height: 1.25, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16, height: 1.35, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontSize: 15, height: 1.35, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
      fontSize: 13,
      height: 1.3,
      fontWeight: FontWeight.w500,
      color: GameColors.inkSoft,
    ),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.3),
  );
}
