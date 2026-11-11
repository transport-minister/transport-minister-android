import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';

class ChunkyPalette {
  const ChunkyPalette({
    required this.face,
    required this.deep,
    required this.lip,
    required this.glow,
    this.onFace = GameColors.paper,
  });

  final Color face;
  final Color deep;
  final Color lip;
  final Color glow;
  final Color onFace;

  bool get needsTextShadow => onFace == GameColors.paper;

  static const green = ChunkyPalette(
    face: Color(0xFF4A9A33),
    deep: Color(0xFF3B7C26),
    lip: Color(0xFF275A16),
    glow: Color(0xFF8CCB6E),
  );

  static const sunny = ChunkyPalette(
    face: Color(0xFFFFC93C),
    deep: Color(0xFFF2AE17),
    lip: Color(0xFFB97A00),
    glow: Color(0xFFFFE39A),
    onFace: GameColors.ink,
  );

  static const coral = ChunkyPalette(
    face: Color(0xFFFF6B5E),
    deep: Color(0xFFE84D41),
    lip: Color(0xFFA8291F),
    glow: Color(0xFFFFA69D),
  );

  static const ocean = ChunkyPalette(
    face: Color(0xFF3FA3F0),
    deep: Color(0xFF2584D6),
    lip: Color(0xFF14559A),
    glow: Color(0xFF94D2FF),
  );

  static const grape = ChunkyPalette(
    face: Color(0xFF9B6CF2),
    deep: Color(0xFF7F4FE0),
    lip: Color(0xFF5530A8),
    glow: Color(0xFFCBB3FF),
  );

  static const tangerine = ChunkyPalette(
    face: Color(0xFFFF9F43),
    deep: Color(0xFFF0841C),
    lip: Color(0xFFB35A00),
    glow: Color(0xFFFFCB94),
  );

  static const bubblegum = ChunkyPalette(
    face: Color(0xFFFF7AA8),
    deep: Color(0xFFF0578E),
    lip: Color(0xFFB02A5C),
    glow: Color(0xFFFFB8D1),
  );

  static const lagoon = ChunkyPalette(
    face: Color(0xFF2EC4B6),
    deep: Color(0xFF1FA396),
    lip: Color(0xFF117267),
    glow: Color(0xFF8FEDE3),
  );

  static const snow = ChunkyPalette(
    face: GameColors.paper,
    deep: Color(0xFFF6F1E6),
    lip: Color(0xFFDDD5C2),
    glow: GameColors.paper,
    onFace: GameColors.ink,
  );

  static const stone = ChunkyPalette(
    face: Color(0xFFCFCBD8),
    deep: Color(0xFFBBB6C6),
    lip: Color(0xFF948FA4),
    glow: Color(0xFFE6E3EC),
    onFace: GameColors.inkSoft,
  );
}
