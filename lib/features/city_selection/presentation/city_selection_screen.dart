import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/features/city_selection/presentation/city_selection_providers.dart';
import 'package:transport_minister/features/city_selection/presentation/widgets/city_info_sheet.dart';
import 'package:transport_minister/features/city_selection/presentation/widgets/featured_city_card.dart';
import 'package:transport_minister/features/city_selection/presentation/widgets/upcoming_city_card.dart';
import 'package:transport_minister/features/progression/presentation/ministerial_rank_text.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CitySelectionScreen extends ConsumerWidget {
  const CitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final cities = ref.watch(citiesProvider);
    List<City> withAvailability(CityAvailability availability) =>
        cities.where((city) => city.availability == availability).toList();

    return Scaffold(
      body: GameBackdrop(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              GameDimens.spaceL,
              GameDimens.spaceXL,
              GameDimens.spaceL,
              GameDimens.spaceXXL,
            ),
            children: [
              Text(l10n.citySelectionTitle, style: textTheme.headlineLarge),
              const SizedBox(height: GameDimens.spaceXS),
              Text(
                l10n.citySelectionSubtitle,
                style: textTheme.bodyLarge?.copyWith(color: GameColors.inkSoft),
              ),
              const SizedBox(height: GameDimens.spaceXL),
              for (final city in withAvailability(CityAvailability.playable)) ...[
                FeaturedCityCard(
                  city: city,
                  onPlay: () => context.goNamed(
                    AppRoute.dashboard.name,
                    pathParameters: {AppRoute.cityIdParameter: city.id.name},
                  ),
                ),
                const SizedBox(height: GameDimens.spaceXL),
              ],
              _CitySection(
                title: l10n.citySectionComingSoon,
                cities: withAvailability(CityAvailability.comingSoon),
                onCityPressed: (city) => _showComingSoon(context, city),
              ),
              _CitySection(
                title: l10n.citySectionLocked,
                cities: withAvailability(CityAvailability.locked),
                onCityPressed: (city) => _showLocked(context, city),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, City city) {
    final l10n = AppLocalizations.of(context);
    showChunkySheet<void>(
      context: context,
      builder: (context) => CityInfoSheet(
        icon: Icons.construction_rounded,
        palette: ChunkyPalette.sunny,
        title: l10n.cityComingSoonTitle(city.id.displayName(l10n)),
        body: l10n.cityComingSoonBody,
      ),
    );
  }

  void _showLocked(BuildContext context, City city) {
    final l10n = AppLocalizations.of(context);
    final rank = city.requiredRank;
    showChunkySheet<void>(
      context: context,
      builder: (context) => CityInfoSheet(
        icon: Icons.lock_rounded,
        palette: ChunkyPalette.grape,
        title: l10n.cityLockedTitle(city.id.displayName(l10n)),
        body: rank == null ? l10n.cityComingSoonBody : l10n.cityLockedBody(rank.title(l10n)),
      ),
    );
  }
}

class _CitySection extends StatelessWidget {
  const _CitySection({required this.title, required this.cities, required this.onCityPressed});

  final String title;
  final List<City> cities;
  final ValueChanged<City> onCityPressed;

  @override
  Widget build(BuildContext context) {
    if (cities.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: GameDimens.spaceL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: GameDimens.spaceM),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = (constraints.maxWidth - GameDimens.spaceM) / 2;
              return Wrap(
                spacing: GameDimens.spaceM,
                runSpacing: GameDimens.spaceM,
                children: [
                  for (final city in cities)
                    SizedBox(
                      width: width,
                      child: UpcomingCityCard(city: city, onPressed: () => onCityPressed(city)),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
