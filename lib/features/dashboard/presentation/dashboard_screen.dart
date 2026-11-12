import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
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
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
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
import 'package:transport_minister/features/dashboard/presentation/widgets/district_sheet.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/level_sheets.dart';
import 'package:transport_minister/features/decisions/presentation/decision_sheets.dart';
import 'package:transport_minister/features/decisions/presentation/decision_texts.dart';
import 'package:transport_minister/features/inbox/application/inbox_controller.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';
import 'package:transport_minister/features/progression/presentation/progression_texts.dart';
import 'package:transport_minister/features/progression/presentation/widgets/promotion_sheet.dart';
import 'package:transport_minister/features/technology/presentation/diplomacy_button.dart';
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
      final before = previous?.value;
      final after = next.value;
      if (before == null || after == null) {
        return;
      }
      if (!identical(after.latestEvents, before.latestEvents)) {
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
    final tip = const Advisor().bestTip(city, metrics);
    final unread = ref.watch(inboxProvider).value?.unread ?? 0;
    final daily = ref.watch(dailyProvider).value;
    final claimable = daily == null
        ? 0
        : const DailyRules().claimable(daily, ref.watch(nowProvider)());
    final slowest = metrics.districts.reduce((a, b) => b.waitingMinutes > a.waitingMinutes ? b : a);
    return Stack(
      children: [
        Column(
          children: [
            DashboardHud(
              targets: _targets,
              city: city,
              rank: ref.watch(profileProvider).value?.rank ?? MinisterialRank.juniorOfficial,
              dayProgress: widget.session.dayProgress,
              onProfilePressed: () => _leaveFor(AppRoute.profile.path),
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
                          child: DiplomacyButton(
                            points: city.diplomacyPoints,
                            ready: TechnologyId.values.any(
                              (technology) =>
                                  const CityCommands().technologyProblem(city, technology) == null,
                            ),
                            onPressed: () =>
                                _leaveFor(AppRoute.technology.forCity(widget.cityId.name)),
                          ),
                        ),
                        Positioned(
                          right: GameDimens.spaceS,
                          top: GameDimens.spaceS,
                          child: ChunkyIconButton(
                            icon: Icons.notifications_rounded,
                            size: 42,
                            semanticsLabel: AppLocalizations.of(context).inboxOpen,
                            badge: unread > 0 ? '$unread' : null,
                            onPressed: () => _leaveFor(AppRoute.inbox.path),
                          ),
                        ),
                        Positioned(
                          right: GameDimens.spaceS,
                          top: 62,
                          child: ChunkyIconButton(
                            key: _targets.tasks,
                            icon: Icons.task_alt_rounded,
                            size: 42,
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
    final tutorial = ref.read(tutorialProvider.notifier)..onDistrictOpened();
    await showChunkySheet<void>(
      context: context,
      builder: (context) => DistrictSheet(cityId: widget.cityId, district: district),
    );
    tutorial.onDistrictClosed();
  }

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
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    for (final event in events) {
      switch (event) {
        case RankPromoted(:final rank):
          showChunkySheet<void>(
            context: context,
            builder: (context) => PromotionSheet(rank: rank),
          );
        case AchievementUnlocked(:final achievement):
          messenger.showSnackBar(
            SnackBar(content: Text(l10n.achievementToast(achievement.title(l10n), achievement.xp))),
          );
        case BadgeEarned(:final city, :final tier):
          messenger.showSnackBar(
            SnackBar(
              content: Text(l10n.badgeEarnedToast(tier.label(l10n), city.displayName(l10n))),
            ),
          );
      }
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
      builder: (context) => LevelInfoSheet(
        cityName: widget.cityId.displayName(l10n),
        level: widget.session.city.level,
        nextCityName: _nextCityName(),
      ),
    );
  }

  void _announce(CityGameSession session) {
    ref.read(tutorialProvider.notifier).onCityEvents(session.latestEvents);
    final l10n = AppLocalizations.of(context);
    final levelUps = session.latestEvents.whereType<CityLeveledUp>().toList();
    if (levelUps.isNotEmpty) {
      final latest = levelUps.last;
      showChunkySheet<void>(
        context: context,
        builder: (context) => LevelUpSheet(
          cityName: widget.cityId.displayName(l10n),
          level: latest.level,
          reward: levelUps.fold(0, (sum, event) => sum + event.reward),
          diplomacy: levelUps.fold(0, (sum, event) => sum + event.diplomacy),
          unlockedCityName: latest.level >= CityLevels.targetLevel ? _nextCityName() : null,
        ),
      );
    }
    final messenger = ScaffoldMessenger.of(context);
    for (final arrival in session.latestEvents.whereType<DecisionArrived>()) {
      final decision = session.city.decisions
          .where((pending) => pending.template == arrival.decision)
          .lastOrNull;
      if (decision == null) {
        continue;
      }
      if (arrival.decision.kind == DecisionKind.disaster) {
        showDecision(context, widget.cityId, decision.id);
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text(
              l10n.eventDecisionArrived(arrival.decision.title(l10n, arrival.district)),
            ),
          ),
        );
      }
    }
    final others = session.latestEvents.where((event) => !event.isSilent);
    for (final event in others.toList().reversed.take(2)) {
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
