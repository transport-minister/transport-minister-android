import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';
import 'package:transport_minister/core/design/game_typography.dart';

abstract final class GameTheme {
  static ThemeData light() {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: ChunkyPalette.green.face,
      onPrimary: ChunkyPalette.green.onFace,
      secondary: ChunkyPalette.sunny.face,
      onSecondary: ChunkyPalette.sunny.onFace,
      tertiary: ChunkyPalette.ocean.face,
      onTertiary: ChunkyPalette.ocean.onFace,
      error: ChunkyPalette.coral.face,
      onError: ChunkyPalette.coral.onFace,
      surface: GameColors.cream,
      onSurface: GameColors.ink,
      onSurfaceVariant: GameColors.inkSoft,
      outline: GameColors.ink,
      surfaceContainerHighest: GameColors.sand,
    );
    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: GameColors.cream,
      fontFamily: GameTypography.fontFamily,
      fontFamilyFallback: GameTypography.fontFamilyFallback,
      textTheme: GameTypography.textTheme.apply(
        bodyColor: GameColors.ink,
        displayColor: GameColors.ink,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(color: GameColors.ink),
      dividerTheme: const DividerThemeData(
        color: GameColors.ink,
        thickness: GameDimens.outlineThin,
        space: GameDimens.spaceXL,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: GameColors.ink,
        contentTextStyle: const TextStyle(
          fontFamily: GameTypography.fontFamily,
          fontFamilyFallback: GameTypography.fontFamilyFallback,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: GameColors.paper,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(GameDimens.radiusM)),
      ),
    );
  }
}
