import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/metro_rules.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_panel_parts.dart';
import 'package:transport_minister/features/technology/presentation/technology_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DistrictMetroTab extends StatelessWidget {
  const DistrictMetroTab({
    super.key,
    required this.city,
    required this.metrics,
    required this.district,
    required this.onAction,
    required this.onOpenTechnology,
  });

  final CityState city;
  final CityMetrics metrics;
  final DistrictId district;
  final DistrictAction onAction;
  final VoidCallback onOpenTechnology;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final unlocked = city.has(TechnologyId.metroContract);
    final automated = city.metroAutomated;
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: panelBottomSpace),
      sliver: SliverList.list(
        children: [
          MrBusSays(
            message: unlocked
                ? l10n.metroIntro(
                    MoneyFormat.count(MetroRules.stationRiders(automated: automated)),
                    MoneyFormat.compact(MetroRules.lineCost(automated: automated)),
                  )
                : l10n.metroTeaser,
            mood: MrBusMood.thinking,
            mascotSize: 56,
          ),
          const SizedBox(height: GameDimens.spaceM),
          if (unlocked) ...[
            PanelSectionTitle(title: l10n.metroLinesTitle(district.displayName(l10n))),
            for (final neighbour in DistrictLinks.neighboursOf(district))
              _MetroLineCard(
                city: city,
                from: district,
                to: neighbour,
                waiting: metrics.of(neighbour).waitingMinutes,
                onAction: onAction,
              ),
          ] else
            _LockedMetro(onOpenTechnology: onOpenTechnology),
        ],
      ),
    );
  }
}

class _LockedMetro extends StatelessWidget {
  const _LockedMetro({required this.onOpenTechnology});

  final VoidCallback onOpenTechnology;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ChunkyCard(
      depth: 3,
      color: GameColors.sand,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Row(
        children: [
          const IconBubble(icon: Icons.lock_rounded, palette: ChunkyPalette.stone, size: 44),
          const SizedBox(width: GameDimens.spaceM),
          Expanded(
            child: Text(
              l10n.technologyRequires(TechnologyId.metroContract.label(l10n)),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ChunkyButton(
            label: l10n.contractOpenTechnology,
            icon: Icons.science_rounded,
            palette: ChunkyPalette.lagoon,
            size: ChunkySize.small,
            onPressed: onOpenTechnology,
          ),
        ],
      ),
    );
  }
}

class _MetroLineCard extends StatelessWidget {
  const _MetroLineCard({
    required this.city,
    required this.from,
    required this.to,
    required this.waiting,
    required this.onAction,
  });

  final CityState city;
  final DistrictId from;
  final DistrictId to;
  final double waiting;
  final DistrictAction onAction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    const commands = CityCommands();
    final line = city.metroLines.where((line) => line.joins(from, to)).firstOrNull;
    final problem = commands.metroProblem(city, from, to);
    final open = line?.isOpen ?? false;
    return Padding(
      padding: const EdgeInsets.only(bottom: GameDimens.spaceS),
      child: ChunkyCard(
        depth: 3,
        color: open ? ChunkyPalette.grape.glow.withValues(alpha: 0.35) : GameColors.paper,
        padding: const EdgeInsets.all(GameDimens.spaceM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconBubble(icon: to.icon, palette: to.palette, size: 44),
                const SizedBox(width: GameDimens.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.metroLineTo(to.displayName(l10n)),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        l10n.metroWaitingThere(waiting.round()),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: GameDimens.spaceS),
            if (line == null) ...[
              Row(
                children: [
                  GameTag(
                    label: l10n.buildDays(MetroRules.buildDays),
                    palette: ChunkyPalette.snow,
                    icon: Icons.schedule_rounded,
                  ),
                  const SizedBox(width: GameDimens.spaceS),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ChunkyButton(
                        label: l10n.metroDig(MoneyFormat.compact(MetroRules.buildCost)),
                        icon: Icons.subway_rounded,
                        palette: ChunkyPalette.grape,
                        size: ChunkySize.small,
                        onPressed: problem == null
                            ? () => onAction(
                                (city) => commands.buildMetroLine(city, from, to),
                                l10n.eventMetroStarted(
                                  from.displayName(l10n),
                                  to.displayName(l10n),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              if (problem != null) ProblemText(problem.message(l10n)),
            ] else if (open)
              Align(
                alignment: Alignment.centerLeft,
                child: GameTag(
                  label: l10n.metroOpen,
                  palette: ChunkyPalette.grape,
                  icon: Icons.subway_rounded,
                ),
              )
            else ...[
              Align(
                alignment: Alignment.centerLeft,
                child: GameTag(
                  label: l10n.buildDaysLeft(line.remainingDays),
                  palette: ChunkyPalette.tangerine,
                  icon: Icons.hourglass_top_rounded,
                ),
              ),
              const SizedBox(height: GameDimens.spaceS),
              ChunkyProgressBar(value: line.progress, palette: ChunkyPalette.grape, height: 12),
            ],
          ],
        ),
      ),
    );
  }
}
