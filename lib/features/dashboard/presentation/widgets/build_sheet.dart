import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/fleet_advisor.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/project.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/project_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_game/presentation/time_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class BuildSheet extends ConsumerWidget {
  const BuildSheet({super.key, required this.cityId, required this.onOpenDistrict});

  final CityId cityId;
  final ValueChanged<DistrictId> onOpenDistrict;

  static const _advisor = FleetAdvisor();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final city = ref.watch(cityGameProvider(cityId)).value?.city;
    if (city == null) {
      return const SizedBox.shrink();
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.buildSheetTitle, style: textTheme.headlineSmall),
            const SizedBox(height: GameDimens.spaceXS),
            Text(l10n.buildSheetBody, style: textTheme.bodySmall),
            const SizedBox(height: GameDimens.spaceM),
            for (final district in DistrictId.values) ...[
              _DistrictRow(
                cityId: cityId,
                district: district,
                city: city,
                running: city.projects
                    .where((project) => project.districtId == district)
                    .firstOrNull,
                next: _advisor.nextProject(city, district),
                onOpen: () => onOpenDistrict(district),
              ),
              const SizedBox(height: GameDimens.spaceS),
            ],
          ],
        ),
      ),
    );
  }
}

class _DistrictRow extends ConsumerWidget {
  const _DistrictRow({
    required this.cityId,
    required this.district,
    required this.city,
    required this.running,
    required this.next,
    required this.onOpen,
  });

  final CityId cityId;
  final DistrictId district;
  final CityState city;
  final Project? running;
  final ProjectType? next;
  final VoidCallback onOpen;

  static const _rules = ProjectRules();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return ChunkyCard(
      depth: 3,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Row(
        children: [
          PressableBuilder(
            onPressed: onOpen,
            semanticsLabel: district.displayName(l10n),
            pressedScale: 0.9,
            builder: (context, pressed) =>
                IconBubble(icon: district.icon, palette: district.palette, size: 40),
          ),
          const SizedBox(width: GameDimens.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(district.displayName(l10n), style: textTheme.titleMedium),
                const SizedBox(height: GameDimens.spaceXS),
                _action(l10n, ref),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _action(AppLocalizations l10n, WidgetRef ref) {
    final project = running;
    final type = next;
    if (project != null) {
      return GameTag(
        label: l10n.buildTimeLeft(TimeTexts.duration(l10n, project.remainingSeconds)),
        palette: ChunkyPalette.tangerine,
        icon: Icons.hourglass_top_rounded,
      );
    }
    if (type == null) {
      return GameTag(
        label: l10n.buildDone,
        palette: ChunkyPalette.green,
        icon: Icons.check_rounded,
      );
    }
    return ChunkyButton(
      label: l10n.buildNext(
        type.label(l10n),
        MoneyFormat.compact(_rules.cost(city, type, district: district)),
      ),
      icon: type.icon,
      palette: ChunkyPalette.tangerine,
      size: ChunkySize.small,
      onPressed: _rules.validate(city, type, district: district) == null
          ? () => ref
                .read(cityGameProvider(cityId).notifier)
                .perform(
                  (state) => const CityCommands().startProject(state, type, district: district),
                )
          : null,
    );
  }
}
