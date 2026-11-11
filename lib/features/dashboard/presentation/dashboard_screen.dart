import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_session.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/away_summary_sheet.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_lifecycle_scope.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/crisis_banner.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/daily_report_card.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/dashboard_hud.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/dismissal_view.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district_sheet.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district_strip.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key, required this.cityId});

  final CityId cityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(cityGameProvider(cityId));
    final session = game.value;
    return Scaffold(
      body: GameBackdrop(
        child: session != null
            ? CityLifecycleScope(
                cityId: cityId,
                child: _CityView(cityId: cityId, session: session),
              )
            : _Status(
                failed: game.hasError,
                onRetry: () => ref.invalidate(cityGameProvider(cityId)),
              ),
      ),
    );
  }
}

class _CityView extends ConsumerStatefulWidget {
  const _CityView({required this.cityId, required this.session});

  final CityId cityId;
  final CityGameSession session;

  @override
  ConsumerState<_CityView> createState() => _CityViewState();
}

class _CityViewState extends ConsumerState<_CityView> {
  final _mapController = CityMapController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.session.awaySummary != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _showAwaySummary());
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(cityGameProvider(widget.cityId), (previous, next) {
      final before = previous?.value;
      final after = next.value;
      if (before == null || after == null) {
        return;
      }
      if (after.awaySummary != null && before.awaySummary == null) {
        _showAwaySummary();
      } else if (!identical(after.latestEvents, before.latestEvents)) {
        _announce(after);
      }
    });
    final city = widget.session.city;
    if (city.crisis.dismissed) {
      return DismissalView(
        onRestart: () => ref.read(cityGameProvider(widget.cityId).notifier).restartCity(),
      );
    }
    final metrics = const MetricsCalculator().calculate(city);
    return Column(
      children: [
        DashboardHud(
          city: city,
          dayProgress: widget.session.dayProgress,
          onCitiesPressed: () => context.go(AppRoute.cities.path),
        ),
        CrisisBanner(crisis: city.crisis),
        DistrictStrip(metrics: metrics, onDistrictPressed: _focusDistrict),
        const SizedBox(height: GameDimens.spaceS),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: GameDimens.spaceL),
            child: ChunkyCard(
              padding: EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(GameDimens.radiusL - GameDimens.outline),
                child: CityMap(
                  city: city,
                  metrics: metrics,
                  controller: _mapController,
                  onDistrictPressed: _openDistrict,
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              GameDimens.spaceL,
              GameDimens.spaceM,
              GameDimens.spaceL,
              GameDimens.spaceM,
            ),
            child: DailyReportCard(report: city.lastReport),
          ),
        ),
      ],
    );
  }

  Future<void> _focusDistrict(DistrictId district) async {
    _mapController.focusOn(district);
    await Future<void>.delayed(const Duration(milliseconds: 380));
    if (mounted) {
      _openDistrict(district);
    }
  }

  void _openDistrict(DistrictId district) {
    showChunkySheet<void>(
      context: context,
      builder: (context) => DistrictSheet(cityId: widget.cityId, district: district),
    );
  }

  Future<void> _showAwaySummary() async {
    final summary = ref.read(cityGameProvider(widget.cityId)).value?.awaySummary;
    if (summary == null || !mounted) {
      return;
    }
    await showChunkySheet<void>(
      context: context,
      builder: (context) => AwaySummarySheet(summary: summary),
    );
    ref.read(cityGameProvider(widget.cityId).notifier).dismissAwaySummary();
  }

  void _announce(CityGameSession session) {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    for (final event in session.latestEvents.reversed.take(2)) {
      messenger.showSnackBar(
        SnackBar(duration: const Duration(seconds: 2), content: Text(event.message(l10n))),
      );
    }
  }
}

class _Status extends StatelessWidget {
  const _Status({required this.failed, required this.onRetry});

  final bool failed;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconBubble(
            icon: failed ? Icons.cloud_off_rounded : Icons.directions_bus_rounded,
            palette: failed ? ChunkyPalette.coral : ChunkyPalette.sunny,
            size: 64,
          ),
          const SizedBox(height: GameDimens.spaceL),
          Text(
            failed ? l10n.loadingFailed : l10n.loadingCity,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (failed) ...[
            const SizedBox(height: GameDimens.spaceL),
            ChunkyButton(label: l10n.commonRetry, onPressed: onRetry),
          ],
        ],
      ),
    );
  }
}
