import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/project_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_panel_parts.dart';
import 'package:transport_minister/features/decisions/presentation/effect_chips.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DistrictBuildTab extends StatelessWidget {
  const DistrictBuildTab({
    super.key,
    required this.city,
    required this.district,
    required this.onAction,
  });

  final CityState city;
  final DistrictId district;
  final DistrictAction onAction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: panelBottomSpace),
      sliver: SliverList.list(
        children: [
          PanelSectionTitle(title: l10n.buildDistrictTitle(district.displayName(l10n))),
          for (final type in ProjectType.values.where((type) => !type.isCityWide))
            _ProjectCard(type: type, city: city, district: district, onAction: onAction),
          const SizedBox(height: GameDimens.spaceM),
          PanelSectionTitle(title: l10n.buildCityTitle),
          for (final type in ProjectType.values.where((type) => type.isCityWide))
            _ProjectCard(type: type, city: city, onAction: onAction),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.type,
    required this.city,
    required this.onAction,
    this.district,
  });

  final ProjectType type;
  final CityState city;
  final DistrictId? district;
  final DistrictAction onAction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    const rules = ProjectRules();
    final running = city.projects
        .where((project) => project.type == type && project.districtId == district)
        .firstOrNull;
    final done = running == null && !rules.isUseful(city, type, district: district);
    final problem = rules.validate(city, type, district: district);
    return Padding(
      padding: const EdgeInsets.only(bottom: GameDimens.spaceS),
      child: ChunkyCard(
        depth: 3,
        color: done ? ChunkyPalette.green.glow.withValues(alpha: 0.35) : GameColors.paper,
        padding: const EdgeInsets.all(GameDimens.spaceM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBubble(icon: type.icon, palette: type.palette, size: 44),
                const SizedBox(width: GameDimens.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(type.label(l10n), style: Theme.of(context).textTheme.titleMedium),
                      Text(type.info(l10n), style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: GameDimens.spaceS),
            Wrap(
              spacing: GameDimens.spaceXS,
              runSpacing: GameDimens.spaceXS,
              children: [
                for (final (label, tone) in type.highlights(l10n))
                  ToneChip(label: label, tone: tone),
              ],
            ),
            const SizedBox(height: GameDimens.spaceS),
            if (running != null) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: GameTag(
                  label: l10n.buildDaysLeft(running.remainingDays),
                  palette: ChunkyPalette.tangerine,
                  icon: Icons.hourglass_top_rounded,
                ),
              ),
              const SizedBox(height: GameDimens.spaceS),
              ChunkyProgressBar(
                value: running.progress,
                palette: ChunkyPalette.tangerine,
                height: 12,
              ),
            ] else if (done)
              Align(
                alignment: Alignment.centerLeft,
                child: GameTag(
                  label: type == ProjectType.roadRepair ? l10n.buildRoadFine : l10n.buildDone,
                  palette: ChunkyPalette.green,
                  icon: Icons.check_rounded,
                ),
              )
            else ...[
              Row(
                children: [
                  GameTag(
                    label: l10n.buildDays(rules.duration(city, type, district: district)),
                    palette: ChunkyPalette.snow,
                    icon: Icons.schedule_rounded,
                  ),
                  const SizedBox(width: GameDimens.spaceS),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ChunkyButton(
                        label: l10n.buildAction(
                          MoneyFormat.compact(rules.cost(city, type, district: district)),
                        ),
                        icon: Icons.construction_rounded,
                        palette: ChunkyPalette.tangerine,
                        size: ChunkySize.small,
                        onPressed: problem == null
                            ? () => onAction(
                                (city) => const CityCommands().startProject(
                                  city,
                                  type,
                                  district: district,
                                ),
                                l10n.eventProjectStarted(type.label(l10n)),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              if (problem != null) ProblemText(problem.message(l10n)),
            ],
          ],
        ),
      ),
    );
  }
}
