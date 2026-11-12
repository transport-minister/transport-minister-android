import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/population_rules.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/features/city_game/application/city_game_controller.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_build_tab.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_buses_tab.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_metro_tab.dart';
import 'package:transport_minister/features/tutorial/application/tutorial_controller.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

enum DistrictTab {
  buses(Icons.directions_bus_rounded),
  build(Icons.construction_rounded),
  metro(Icons.subway_rounded);

  const DistrictTab(this.icon);

  final IconData icon;

  String label(AppLocalizations l10n) => switch (this) {
    DistrictTab.buses => l10n.tabBuses,
    DistrictTab.build => l10n.tabBuild,
    DistrictTab.metro => l10n.tabMetro,
  };
}

class DistrictSheet extends ConsumerStatefulWidget {
  const DistrictSheet({
    super.key,
    required this.cityId,
    required this.district,
    required this.onOpenTechnology,
  });

  final CityId cityId;
  final DistrictId district;
  final VoidCallback onOpenTechnology;

  @override
  ConsumerState<DistrictSheet> createState() => _DistrictSheetState();
}

class _DistrictSheetState extends ConsumerState<DistrictSheet> {
  static const _receiptTime = Duration(milliseconds: 2600);

  var _tab = DistrictTab.buses;
  var _receipts = 0;
  (String, bool)? _receipt;
  Timer? _receiptTimer;

  @override
  void dispose() {
    _receiptTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(tutorialProvider, (previous, next) {
      if (previous == TutorialStep.buyBus && next == TutorialStep.busBought) {
        Navigator.of(context).pop();
      }
    });
    final city = ref.watch(cityGameProvider(widget.cityId)).value?.city;
    if (city == null) {
      return const SizedBox.shrink();
    }
    final metrics = const MetricsCalculator().calculate(city);
    final receipt = _receipt;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _Header(
                  district: widget.district,
                  metrics: metrics.of(widget.district),
                  road: city.district(widget.district).roadCondition,
                  growth: PopulationRules.dailyGrowth(
                    city.district(widget.district),
                    city.overallSatisfaction,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _PinnedTabs(
                  selected: _tab,
                  onSelected: (tab) => setState(() => _tab = tab),
                ),
              ),
              switch (_tab) {
                DistrictTab.buses => DistrictBusesTab(
                  city: city,
                  metrics: metrics,
                  district: widget.district,
                  guided: ref.watch(tutorialProvider) == TutorialStep.buyBus,
                  onAction: _run,
                  onOpenTechnology: widget.onOpenTechnology,
                ),
                DistrictTab.build => DistrictBuildTab(
                  city: city,
                  district: widget.district,
                  onAction: _run,
                ),
                DistrictTab.metro => DistrictMetroTab(
                  city: city,
                  metrics: metrics,
                  district: widget.district,
                  onAction: _run,
                  onOpenTechnology: widget.onOpenTechnology,
                ),
              },
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: receipt == null
                  ? const SizedBox.shrink()
                  : _Receipt(key: ValueKey(_receipts), message: receipt.$1, success: receipt.$2),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _run(CityCommand command, String success) async {
    final l10n = AppLocalizations.of(context);
    final outcome = await ref.read(cityGameProvider(widget.cityId).notifier).perform(command);
    if (!mounted) {
      return;
    }
    _receiptTimer?.cancel();
    _receiptTimer = Timer(_receiptTime, () => setState(() => _receipt = null));
    setState(() {
      _receipts++;
      _receipt = switch (outcome) {
        CommandApplied() => (success, true),
        CommandRejected(:final reason) => (reason.message(l10n), false),
      };
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.district,
    required this.metrics,
    required this.road,
    required this.growth,
  });

  final DistrictId district;
  final DistrictMetrics metrics;
  final double road;
  final int growth;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final waiting = metrics.waitingMinutes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconBubble(icon: district.icon, palette: district.palette, size: 48),
            const SizedBox(width: GameDimens.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(district.displayName(l10n), style: textTheme.headlineSmall),
                  Text(district.tagline(l10n), style: textTheme.bodySmall),
                  const SizedBox(height: GameDimens.spaceXS),
                  Row(
                    children: [
                      const Icon(Icons.groups_rounded, size: 16, color: GameColors.inkSoft),
                      const SizedBox(width: GameDimens.spaceXS),
                      Flexible(
                        child: Text(
                          l10n.districtResidents(
                            MoneyFormat.count(metrics.population),
                            MoneyFormat.count(growth),
                          ),
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: GameDimens.spaceM),
        Row(
          children: [
            _Stat(
              icon: Icons.schedule_rounded,
              label: l10n.statWaiting,
              value: l10n.statMinutes(waiting.round()),
              palette: waiting <= 8
                  ? ChunkyPalette.green
                  : (waiting <= 15 ? ChunkyPalette.sunny : ChunkyPalette.coral),
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
              value: l10n.statPercent(road.round()),
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
        const SizedBox(height: GameDimens.spaceS),
        ChunkyProgressBar(value: metrics.serviceRatio, palette: ChunkyPalette.ocean, height: 14),
        const SizedBox(height: GameDimens.spaceXS),
        Text(
          l10n.districtRidersServed(
            MoneyFormat.count(metrics.capacity),
            MoneyFormat.count(metrics.demand),
          ),
          style: textTheme.bodySmall,
        ),
      ],
    );
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
          IconBubble(icon: icon, palette: palette, size: 34),
          const SizedBox(height: GameDimens.spaceXS),
          Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _PinnedTabs extends SliverPersistentHeaderDelegate {
  const _PinnedTabs({required this.selected, required this.onSelected});

  static const _extent = 64.0;

  final DistrictTab selected;
  final ValueChanged<DistrictTab> onSelected;

  @override
  double get minExtent => _extent;

  @override
  double get maxExtent => _extent;

  @override
  bool shouldRebuild(_PinnedTabs oldDelegate) => oldDelegate.selected != selected;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final l10n = AppLocalizations.of(context);
    return ColoredBox(
      color: GameColors.cream,
      child: Center(
        child: Row(
          children: [
            for (final tab in DistrictTab.values) ...[
              if (tab.index > 0) const SizedBox(width: GameDimens.spaceS),
              Expanded(
                child: ChunkyButton(
                  label: tab.label(l10n),
                  icon: tab.icon,
                  size: ChunkySize.small,
                  palette: tab == selected ? ChunkyPalette.ocean : ChunkyPalette.snow,
                  expanded: true,
                  onPressed: () => onSelected(tab),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Receipt extends StatelessWidget {
  const _Receipt({super.key, required this.message, required this.success});

  final String message;
  final bool success;

  @override
  Widget build(BuildContext context) {
    final palette = success ? ChunkyPalette.green : ChunkyPalette.coral;
    return Container(
      margin: const EdgeInsets.only(bottom: GameDimens.spaceXS),
      padding: const EdgeInsets.symmetric(
        horizontal: GameDimens.spaceM,
        vertical: GameDimens.spaceM,
      ),
      decoration: BoxDecoration(
        color: palette.face,
        borderRadius: BorderRadius.circular(GameDimens.radiusM),
        border: Border.all(color: GameColors.ink, width: GameDimens.outline),
        boxShadow: const [BoxShadow(color: GameColors.ink, offset: Offset(0, 3))],
      ),
      child: Row(
        children: [
          Icon(
            success ? Icons.check_circle_rounded : Icons.error_rounded,
            color: palette.onFace,
            size: 22,
          ),
          const SizedBox(width: GameDimens.spaceS),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: palette.onFace),
            ),
          ),
        ],
      ),
    );
  }
}
