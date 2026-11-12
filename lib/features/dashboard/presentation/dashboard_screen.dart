import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/advisor/domain/advisor.dart';
import 'package:transport_minister/features/advisor/presentation/advisor_sheet.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_session.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/domain/city_unlocks.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/features/city_selection/presentation/city_selection_providers.dart';
import 'package:transport_minister/features/daily/application/daily_controller.dart';
import 'package:transport_minister/features/daily/domain/daily_rules.dart';
import 'package:transport_minister/features/daily/presentation/daily_sheet.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_level_bar.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_lifecycle_scope.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/crisis_banner.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/dashboard_hud.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/dismissal_view.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_sheet.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/level_sheets.dart';
import 'package:transport_minister/features/decisions/presentation/decision_sheets.dart';
import 'package:transport_minister/features/diplomacy/presentation/diplomacy_texts.dart';
import 'package:transport_minister/features/inbox/application/inbox_controller.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';
import 'package:transport_minister/features/progression/presentation/widgets/promotion_sheet.dart';
import 'package:transport_minister/features/tutorial/application/tutorial_controller.dart';
import 'package:transport_minister/features/tutorial/presentation/tutorial_overlay.dart';
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
  static const _cornerButton = 42.0;

  final _mapController = CityMapController();
  final _targets = TutorialTargets();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startTutorial());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(progressionFeedProvider, (previous, next) => _celebrate(next));
    ref.listen(cityGameProvider(widget.cityId), (previous, next) {
      final session = next.value;
      if (previous?.value != null && session != null && session.latestEvents.isNotEmpty) {
        _announce(session);
      }
    });
    final city = widget.session.city;
    if (city.crisis.dismissed) {
      return DismissalView(
        cause: city.crisis.cause,
        onRestart: () => ref.read(cityGameProvider(widget.cityId).notifier).restartCity(),
      );
    }
    final metrics = const MetricsCalculator().calculate(city);
    final tip = const Advisor().bestTip(city, metrics);
    final unread = ref.watch(inboxProvider).value?.unread ?? 0;
    final daily = ref.watch(dailyProvider).value;
    final claimable = daily == null
        ? 0
        : const DailyRules().claimable(daily, ref.watch(nowProvider)());
    final slowest = metrics.districts.reduce((a, b) => b.waitingMinutes > a.waitingMinutes ? b : a);
    final readyTechnologies = TechnologyId.values
        .where((technology) => const CityCommands().technologyProblem(city, technology) == null)
        .length;
    return Stack(
      children: [
        Column(
          children: [
            DashboardHud(
              targets: _targets,
              city: city,
              rank: ref.watch(profileProvider).value?.rank ?? MinisterialRank.juniorOfficial,
              onProfilePressed: () => _leaveFor(AppRoute.profile.path),
              onDiplomacyPressed: _openDiplomacy,
            ),
            KeyedSubtree(
              key: _targets.level,
              child: CityLevelBar(city: city, onPressed: _showLevelInfo),
            ),
            CrisisBanner(crisis: city.crisis),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  GameDimens.spaceL,
                  0,
                  GameDimens.spaceL,
                  MediaQuery.paddingOf(context).bottom + GameDimens.spaceL,
                ),
                child: ChunkyCard(
                  key: _targets.map,
                  padding: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(GameDimens.radiusL - GameDimens.outline),
                    child: Stack(
                      children: [
                        CityMap(
                          city: city,
                          metrics: metrics,
                          controller: _mapController,
                          onDistrictPressed: _openDistrict,
                        ),
                        Positioned(
                          left: GameDimens.spaceS,
                          top: GameDimens.spaceS,
                          child: ChunkyIconButton(
                            icon: Icons.settings_rounded,
                            size: _cornerButton,
                            semanticsLabel: AppLocalizations.of(context).settingsOpen,
                            onPressed: () => _leaveFor(AppRoute.settings.path),
                          ),
                        ),
                        Positioned(
                          right: GameDimens.spaceS * 2 + _cornerButton,
                          top: GameDimens.spaceS,
                          child: ChunkyIconButton(
                            key: _targets.diplomacy,
                            icon: DiplomacyStyle.icon,
                            size: _cornerButton,
                            palette: DiplomacyStyle.palette,
                            semanticsLabel: AppLocalizations.of(context).diplomacyOpen,
                            badge: readyTechnologies > 0 ? '$readyTechnologies' : null,
                            onPressed: _openDiplomacy,
                          ),
                        ),
                        Positioned(
                          right: GameDimens.spaceS,
                          top: GameDimens.spaceS,
                          child: ChunkyIconButton(
                            icon: Icons.notifications_rounded,
                            size: _cornerButton,
                            semanticsLabel: AppLocalizations.of(context).inboxOpen,
                            badge: unread > 0 ? '$unread' : null,
                            onPressed: () => _leaveFor(AppRoute.inbox.path),
                          ),
                        ),
                        Positioned(
                          right: GameDimens.spaceS,
                          top: GameDimens.spaceS * 2 + _cornerButton,
                          child: ChunkyIconButton(
                            key: _targets.tasks,
                            icon: Icons.task_alt_rounded,
                            size: _cornerButton,
                            palette: ChunkyPalette.sunny,
                            semanticsLabel: AppLocalizations.of(context).dailyOpen,
                            badge: claimable > 0 ? '$claimable' : null,
                            onPressed: () => showChunkySheet<void>(
                              context: context,
                              builder: (context) => DailySheet(cityId: widget.cityId),
                            ),
                          ),
                        ),
                        Positioned(
                          left: GameDimens.spaceS,
                          bottom: GameDimens.spaceS,
                          child: MrBusButton(
                            key: _targets.news,
                            urgent:
                                tip.kind.isUrgent ||
                                city.decisions.any(
                                  (decision) => decision.template.kind == DecisionKind.disaster,
                                ),
                            news: city.decisions.length,
                            onPressed: city.decisions.isEmpty
                                ? () => _showTip(tip)
                                : () => showNews(context, widget.cityId, city.decisions),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        TutorialOverlay(
          cityId: widget.cityId,
          targets: _targets,
          districtName: slowest.id.displayName(AppLocalizations.of(context)),
        ),
      ],
    );
  }

  void _showTip(AdvisorTip tip) {
    showChunkySheet<void>(
      context: context,
      builder: (context) =>
          AdvisorSheet(tip: tip, onShowDistrict: () => _focusDistrict(tip.district!)),
    );
  }

  Future<void> _focusDistrict(DistrictId district) async {
    _mapController.focusOn(district);
    await Future<void>.delayed(const Duration(milliseconds: 380));
    if (mounted) {
      await _openDistrict(district);
    }
  }

  Future<void> _openDistrict(DistrictId district) async {
    final tutorial = ref.read(tutorialProvider.notifier)..onDistrictOpened(widget.cityId);
    final technology = await showChunkySheet<bool>(
      context: context,
      builder: (context) => DistrictSheet(
        cityId: widget.cityId,
        district: district,
        onOpenTechnology: () => Navigator.of(context).pop(true),
      ),
    );
    tutorial.onDistrictClosed();
    if (mounted && (technology ?? false)) {
      await _openTechnology();
    }
  }

  Future<void> _openTechnology() => _leaveFor(AppRoute.technology.forCity(widget.cityId.name));

  Future<void> _openDiplomacy() => _leaveFor(AppRoute.diplomacy.forCity(widget.cityId.name));

  Future<void> _startTutorial() async {
    final profile = await ref.read(profileProvider.future);
    if (mounted && !profile.tutorialDone) {
      ref.read(tutorialProvider.notifier).start();
    }
  }

  Future<void> _leaveFor(String path) async {
    final clock = ref.read(cityGameProvider(widget.cityId).notifier)..leaveDashboard();
    await context.push<void>(path);
    if (mounted) {
      clock.enterDashboard();
    }
  }

  void _celebrate(List<ProgressionEvent> events) {
    for (final rank in events.whereType<RankPromoted>().map((event) => event.rank)) {
      showChunkySheet<void>(
        context: context,
        builder: (context) => PromotionSheet(rank: rank),
      );
    }
  }

  String? _nextCityName() {
    final next = const CityUnlocks().unlockedBy(ref.read(citiesProvider), widget.cityId);
    return next?.id.displayName(AppLocalizations.of(context));
  }

  void _showLevelInfo() {
    final l10n = AppLocalizations.of(context);
    showChunkySheet<void>(
      context: context,
      builder: (context) => CityGoalSheet(
        cityName: widget.cityId.displayName(l10n),
        city: widget.session.city,
        nextCityName: _nextCityName(),
      ),
    );
  }

  void _announce(CityGameSession session) {
    ref.read(tutorialProvider.notifier).onCityEvents(session.latestEvents);
    final l10n = AppLocalizations.of(context);
    final levelUps = session.latestEvents.whereType<CityLeveledUp>().toList();
    if (session.latestEvents.any((event) => event is CityCompleted)) {
      showChunkySheet<void>(
        context: context,
        builder: (context) => CityCompleteSheet(cityName: widget.cityId.displayName(l10n)),
      );
    } else if (levelUps.isNotEmpty) {
      final latest = levelUps.last;
      showChunkySheet<void>(
        context: context,
        builder: (context) => LevelUpSheet(
          cityName: widget.cityId.displayName(l10n),
          level: latest.level,
          reward: levelUps.fold(0, (sum, event) => sum + event.reward),
          diplomacy: levelUps.fold(0, (sum, event) => sum + event.diplomacy),
        ),
      );
    }
    for (final arrival in session.latestEvents.whereType<DecisionArrived>()) {
      final decision = session.city.decisions
          .where((pending) => pending.template == arrival.decision)
          .lastOrNull;
      if (decision != null && arrival.decision.kind == DecisionKind.disaster) {
        showDecision(context, widget.cityId, decision.id);
      }
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
