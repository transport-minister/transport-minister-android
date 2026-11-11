import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/illustrations/city_skyline.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class UpcomingCityCard extends StatelessWidget {
  const UpcomingCityCard({super.key, required this.city, required this.onPressed});

  final City city;
  final VoidCallback onPressed;

  static const _innerRadius = Radius.circular(GameDimens.radiusL - GameDimens.outline);

  bool get _locked => city.availability == CityAvailability.locked;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final name = city.id.displayName(l10n);
    return ChunkyCard(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      semanticsLabel: name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: _innerRadius),
            child: SizedBox(
              height: 92,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ColorFiltered(
                    colorFilter: _saturation(_locked ? 0 : 0.5),
                    child: CitySkyline(scene: city.id.scene),
                  ),
                  if (_locked) ...[
                    ColoredBox(color: GameColors.ink.withValues(alpha: 0.2)),
                    const Center(
                      child: IconBubble(
                        icon: Icons.lock_rounded,
                        palette: ChunkyPalette.snow,
                        size: 44,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const Divider(height: GameDimens.outline, thickness: GameDimens.outline),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              GameDimens.spaceM,
              GameDimens.spaceS,
              GameDimens.spaceM,
              GameDimens.spaceM,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: GameDimens.spaceXS + 2),
                _locked
                    ? GameTag(
                        label: l10n.cityStatusLocked,
                        palette: ChunkyPalette.stone,
                        icon: Icons.lock_rounded,
                      )
                    : GameTag(label: l10n.cityStatusComingSoon, icon: Icons.schedule_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ColorFilter _saturation(double saturation) {
    final rest = 1 - saturation;
    final r = 0.2126 * rest;
    final g = 0.7152 * rest;
    final b = 0.0722 * rest;
    return ColorFilter.matrix([
      r + saturation,
      g,
      b,
      0,
      0,
      r,
      g + saturation,
      b,
      0,
      0,
      r,
      g,
      b + saturation,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }
}
