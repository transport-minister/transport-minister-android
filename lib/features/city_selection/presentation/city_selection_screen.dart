import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/domain/city_unlocks.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/features/city_selection/presentation/city_selection_providers.dart';
import 'package:transport_minister/features/city_selection/presentation/widgets/city_info_sheet.dart';
import 'package:transport_minister/features/city_selection/presentation/widgets/featured_city_card.dart';
import 'package:transport_minister/features/city_selection/presentation/widgets/upcoming_city_card.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CitySelectionScreen extends ConsumerWidget {
  const CitySelectionScreen({super.key});

  static const _unlocks = CityUnlocks();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final cities = ref.watch(citiesProvider);
    final profile = ref.watch(profileProvider).value ?? const MinisterProfile();
    final playable = [
      for (final city in cities)
        if (_unlocks.accessFor(city, profile) == CityAccess.playable) city,
    ];
    final upcoming = [
      for (final city in cities)
        if (_unlocks.accessFor(city, profile) != CityAccess.playable) city,
    ];

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
              for (final city in playable) ...[
                FeaturedCityCard(
                  city: city,
                  level: math.max(profile.bestLevelIn(city.id), 1),
                  onPlay: () => context.goNamed(
                    AppRoute.dashboard.name,
                    pathParameters: {AppRoute.cityIdParameter: city.id.name},
                  ),
                ),
                const SizedBox(height: GameDimens.spaceXL),
              ],
              if (upcoming.isNotEmpty) ...[
                Text(l10n.citySectionNext, style: textTheme.titleLarge),
                const SizedBox(height: GameDimens.spaceM),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = (constraints.maxWidth - GameDimens.spaceM) / 2;
                    return Wrap(
                      spacing: GameDimens.spaceM,
                      runSpacing: GameDimens.spaceM,
                      children: [
                        for (final city in upcoming)
                          SizedBox(width: width, child: _upcomingCard(context, city, profile)),
                      ],
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _upcomingCard(BuildContext context, City city, MinisterProfile profile) {
    final l10n = AppLocalizations.of(context);
    final access = _unlocks.accessFor(city, profile);
    final requirementCity = city.unlockAfter?.displayName(l10n) ?? '';
    return UpcomingCityCard(
      city: city,
      access: access,
      requirement: l10n.cityRequirement(requirementCity),
      progress: _unlocks.progressFor(city, profile),
      onPressed: () => showChunkySheet<void>(
        context: context,
        builder: (context) => access == CityAccess.locked
            ? CityInfoSheet(
                icon: Icons.lock_rounded,
                palette: ChunkyPalette.grape,
                title: l10n.cityLockedTitle(city.id.displayName(l10n)),
                body: l10n.cityLockedBody(requirementCity),
              )
            : CityInfoSheet(
                icon: Icons.construction_rounded,
                palette: ChunkyPalette.sunny,
                title: l10n.cityComingSoonTitle(city.id.displayName(l10n)),
                body: l10n.cityComingSoonBody,
              ),
      ),
    );
  }
}
