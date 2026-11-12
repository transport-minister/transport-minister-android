import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/city_goal.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CityLevelBar extends StatelessWidget {
  const CityLevelBar({super.key, required this.city, required this.onPressed});

  final CityState city;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final level = city.level;
    final points = city.developmentPoints;
    final maxed = CityLevels.isMaxLevel(level);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GameDimens.spaceL,
        0,
        GameDimens.spaceL,
        GameDimens.spaceS,
      ),
      child: ChunkyCard(
        onPressed: onPressed,
        semanticsLabel: l10n.levelBarLabel(level),
        depth: 3,
        radius: GameDimens.radiusM,
        padding: const EdgeInsets.fromLTRB(5, 5, 8, 5),
        child: Row(
          children: [
            LevelBadge(level: level),
            const SizedBox(width: GameDimens.spaceS),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        l10n.levelBarLabel(level),
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: GameDimens.spaceS),
                      Expanded(
                        child: Text(
                          maxed
                              ? l10n.levelBarMax
                              : l10n.levelBarPoints(points, CityLevels.pointsFor(level + 1)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: GameColors.inkSoft,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  ChunkyProgressBar(
                    value: CityLevels.progress(points),
                    palette: ChunkyPalette.grape,
                    height: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(width: GameDimens.spaceS),
            if (city.completed)
              GameTag(
                label: l10n.levelBarComplete,
                palette: ChunkyPalette.green,
                icon: Icons.emoji_events_rounded,
              )
            else
              GameTag(
                label: l10n.levelBarGoal(CityGoal.partsDone(city), CityGoal.parts),
                palette: ChunkyPalette.sunny,
                icon: Icons.flag_rounded,
              ),
          ],
        ),
      ),
    );
  }
}

class LevelBadge extends StatelessWidget {
  const LevelBadge({super.key, required this.level, this.size = 34});

  final int level;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: GameColors.ink, width: GameDimens.outline),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ChunkyPalette.grape.glow, ChunkyPalette.grape.face, ChunkyPalette.grape.deep],
          stops: const [0.2, 0.2, 1],
        ),
      ),
      child: Text(
        '$level',
        style: TextStyle(
          fontSize: size * 0.48,
          fontWeight: FontWeight.w700,
          color: GameColors.paper,
          height: 1,
          shadows: const [Shadow(color: GameColors.textShadow, offset: Offset(0, 1.5))],
        ),
      ),
    );
  }
}
