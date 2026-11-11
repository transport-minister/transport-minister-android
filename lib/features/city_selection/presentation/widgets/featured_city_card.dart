import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/illustrations/city_skyline.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class FeaturedCityCard extends StatelessWidget {
  const FeaturedCityCard({super.key, required this.city, required this.onPlay});

  final City city;
  final VoidCallback onPlay;

  static const _innerRadius = Radius.circular(GameDimens.radiusL - GameDimens.outline);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return ChunkyCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: _innerRadius),
            child: SizedBox(
              height: 170,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CitySkyline(scene: city.id.scene),
                  Positioned(
                    top: GameDimens.spaceM,
                    left: GameDimens.spaceM,
                    child: GameTag(
                      label: l10n.cityStatusPlayable,
                      palette: ChunkyPalette.green,
                      icon: Icons.play_circle_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: GameDimens.outline, thickness: GameDimens.outline),
          Padding(
            padding: const EdgeInsets.all(GameDimens.spaceL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(city.id.displayName(l10n), style: textTheme.headlineLarge),
                const SizedBox(height: GameDimens.spaceXS),
                Text(
                  city.id.tagline(l10n),
                  style: textTheme.bodyMedium?.copyWith(color: GameColors.inkSoft),
                ),
                const SizedBox(height: GameDimens.spaceM),
                Wrap(
                  spacing: GameDimens.spaceM,
                  runSpacing: GameDimens.spaceS,
                  children: [
                    _Feature(
                      icon: Icons.directions_bus_rounded,
                      label: l10n.cityFeatureBuses,
                      palette: ChunkyPalette.ocean,
                    ),
                    _Feature(
                      icon: Icons.add_road_rounded,
                      label: l10n.cityFeatureRoads,
                      palette: ChunkyPalette.tangerine,
                    ),
                    _Feature(
                      icon: Icons.pedal_bike_rounded,
                      label: l10n.cityFeatureBikeLanes,
                      palette: ChunkyPalette.lagoon,
                    ),
                  ],
                ),
                const SizedBox(height: GameDimens.spaceL),
                ChunkyButton(
                  label: l10n.cityPlay,
                  icon: Icons.play_arrow_rounded,
                  size: ChunkySize.large,
                  expanded: true,
                  onPressed: onPlay,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({required this.icon, required this.label, required this.palette});

  final IconData icon;
  final String label;
  final ChunkyPalette palette;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconBubble(icon: icon, palette: palette, size: 30),
        const SizedBox(width: GameDimens.spaceXS + 2),
        Text(label, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
