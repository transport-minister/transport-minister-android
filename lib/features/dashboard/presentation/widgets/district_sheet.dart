import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/features/city_game/application/city_game_controller.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/tutorial/application/tutorial_controller.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DistrictSheet extends ConsumerWidget {
  const DistrictSheet({super.key, required this.cityId, required this.district});

  final CityId cityId;
  final DistrictId district;

  static const _quickBus = BusModelId.cityRunner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(cityGameProvider(cityId)).value;
    if (session == null) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final city = session.city;
    final state = city.district(district);
    final metrics = const MetricsCalculator().calculate(city).of(district);
    final project = city.projects.where((project) => project.districtId == district).firstOrNull;
    final repairCost = const ProjectRules().cost(city, ProjectType.roadRepair, district: district);
    final guided = ref.watch(tutorialProvider) == TutorialStep.buyBus;
    ref.listen(tutorialProvider, (previous, next) {
      if (previous == TutorialStep.buyBus && next == TutorialStep.busBought) {
        Navigator.of(context).pop();
      }
    });
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconBubble(icon: district.icon, palette: district.palette, size: 52),
            const SizedBox(width: GameDimens.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(district.displayName(l10n), style: textTheme.headlineSmall),
                  Text(district.tagline(l10n), style: textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: GameDimens.spaceL),
        Row(
          children: [
            _Stat(
              icon: Icons.schedule_rounded,
              label: l10n.statWaiting,
              value: l10n.statMinutes(metrics.waitingMinutes.round()),
              palette: metrics.waitingMinutes <= 8
                  ? ChunkyPalette.green
                  : (metrics.waitingMinutes <= 15 ? ChunkyPalette.sunny : ChunkyPalette.coral),
            ),
            _Stat(
              icon: Icons.traffic_rounded,
              label: l10n.statCongestion,
              value: l10n.statPercent(metrics.congestion.round()),
              palette: ChunkyPalette.tangerine,
            ),
            _Stat(
              icon: Icons.add_road_rounded,
              label: l10n.statRoad,
              value: l10n.statPercent(state.roadCondition.round()),
              palette: ChunkyPalette.grape,
            ),
            _Stat(
              icon: Icons.directions_bus_rounded,
              label: l10n.statBuses,
              value: '${metrics.buses}',
              palette: ChunkyPalette.ocean,
            ),
          ],
        ),
        const SizedBox(height: GameDimens.spaceL),
        ChunkyProgressBar(value: metrics.serviceRatio, palette: ChunkyPalette.ocean, height: 18),
        const SizedBox(height: GameDimens.spaceXS),
        Text(
          l10n.districtRidersServed(
            MoneyFormat.count(metrics.capacity),
            MoneyFormat.count(metrics.demand),
          ),
          style: textTheme.bodySmall,
        ),
        const SizedBox(height: GameDimens.spaceM),
        Wrap(
          spacing: GameDimens.spaceS,
          runSpacing: GameDimens.spaceS,
          children: [
            _Feature(label: l10n.districtFeatureBikeLanes, built: state.hasBikeLanes),
            _Feature(label: l10n.districtFeatureSignals, built: state.hasSmartSignals),
            _Feature(label: l10n.districtFeatureStops, built: state.hasModernStops),
          ],
        ),
        if (project != null) ...[
          const SizedBox(height: GameDimens.spaceM),
          Text(
            l10n.districtDaysLeft(project.type.label(l10n), project.remainingDays),
            style: textTheme.titleSmall,
          ),
          const SizedBox(height: GameDimens.spaceXS),
          ChunkyProgressBar(value: project.progress, palette: ChunkyPalette.tangerine, height: 14),
        ],
        const SizedBox(height: GameDimens.spaceXL),
        if (guided) ...[
          MrBusSays(message: l10n.tutorialBuyBus, mood: MrBusMood.excited, mascotSize: 60),
          const SizedBox(height: GameDimens.spaceM),
        ],
        ChunkyButton(
          label: l10n.actionAddBus(MoneyFormat.compact(_quickBus.spec.price)),
          icon: Icons.directions_bus_rounded,
          palette: ChunkyPalette.ocean,
          expanded: true,
          onPressed: () => _run(
            context,
            ref,
            (city) => const CityCommands().buyBus(city, model: _quickBus, district: district),
          ),
        ),
        const SizedBox(height: GameDimens.spaceM),
        ChunkyButton(
          label: l10n.actionRepairRoad(MoneyFormat.compact(repairCost)),
          icon: Icons.construction_rounded,
          palette: ChunkyPalette.sunny,
          expanded: true,
          onPressed: project == null && state.roadCondition < 95
              ? () => _run(
                  context,
                  ref,
                  (city) => const CityCommands().startProject(
                    city,
                    ProjectType.roadRepair,
                    district: district,
                  ),
                )
              : null,
        ),
      ],
    );
  }

  Future<void> _run(BuildContext context, WidgetRef ref, CityCommand command) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final outcome = await ref.read(cityGameProvider(cityId).notifier).perform(command);
    if (outcome case CommandRejected(:final reason)) {
      messenger.showSnackBar(SnackBar(content: Text(reason.message(l10n))));
    }
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.icon,
    required this.label,
    required this.value,
    required this.palette,
  });

  final IconData icon;
  final String label;
  final String value;
  final ChunkyPalette palette;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          IconBubble(icon: icon, palette: palette, size: 38),
          const SizedBox(height: GameDimens.spaceXS),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({required this.label, required this.built});

  final String label;
  final bool built;

  @override
  Widget build(BuildContext context) {
    return GameTag(
      label: label,
      palette: built ? ChunkyPalette.green : ChunkyPalette.snow,
      icon: built ? Icons.check_rounded : Icons.close_rounded,
    );
  }
}
