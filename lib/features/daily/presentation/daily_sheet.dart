import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/daily/application/daily_controller.dart';
import 'package:transport_minister/features/daily/domain/daily_rules.dart';
import 'package:transport_minister/features/daily/domain/daily_state.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DailySheet extends ConsumerWidget {
  const DailySheet({super.key, required this.cityId});

  final CityId cityId;

  static const _rules = DailyRules();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final daily = ref.watch(dailyProvider).value;
    if (daily == null) {
      return const SizedBox.shrink();
    }
    final today = ref.watch(nowProvider)();
    final canClaimStreak = _rules.canClaimStreak(daily, today);
    final streakDay = canClaimStreak
        ? _rules.nextStreakDay(daily, today)
        : (daily.streakDays - 1) % DailyRules.streakMoney.length + 1;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.dailyStreakTitle, style: textTheme.headlineSmall),
            const SizedBox(height: GameDimens.spaceS),
            ChunkyCard(
              color: ChunkyPalette.sunny.glow,
              depth: 3,
              padding: const EdgeInsets.all(GameDimens.spaceM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.dailyStreakDay(streakDay), style: textTheme.titleMedium),
                  const SizedBox(height: GameDimens.spaceS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var day = 1; day <= DailyRules.streakMoney.length; day++)
                        _GiftBox(
                          day: day,
                          opened: day < streakDay || (!canClaimStreak && day == streakDay),
                          today: day == streakDay,
                        ),
                    ],
                  ),
                  const SizedBox(height: GameDimens.spaceM),
                  canClaimStreak
                      ? ChunkyButton(
                          label:
                              '${l10n.dailyClaim} ${MoneyFormat.compact(DailyRules.streakMoney[streakDay - 1])}',
                          icon: Icons.redeem_rounded,
                          palette: ChunkyPalette.grape,
                          expanded: true,
                          onPressed: () => ref.read(dailyProvider.notifier).claimStreak(cityId),
                        )
                      : Text(
                          l10n.dailyStreakDone,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium,
                        ),
                ],
              ),
            ),
            const SizedBox(height: GameDimens.spaceXL),
            Text(l10n.dailyTitle, style: textTheme.headlineSmall),
            const SizedBox(height: GameDimens.spaceS),
            for (var index = 0; index < daily.tasks.length; index++) ...[
              _TaskCard(
                task: daily.tasks[index],
                onClaim: () => ref.read(dailyProvider.notifier).claimTask(cityId, index),
              ),
              const SizedBox(height: GameDimens.spaceM),
            ],
            Text(l10n.dailyComeBack, textAlign: TextAlign.center, style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _GiftBox extends StatelessWidget {
  const _GiftBox({required this.day, required this.opened, required this.today});

  final int day;
  final bool opened;
  final bool today;

  @override
  Widget build(BuildContext context) {
    final palette = opened
        ? ChunkyPalette.green
        : (today ? ChunkyPalette.grape : ChunkyPalette.snow);
    return Column(
      children: [
        IconBubble(
          icon: opened ? Icons.check_rounded : Icons.card_giftcard_rounded,
          palette: palette,
          size: today ? 38 : 32,
        ),
        const SizedBox(height: 2),
        Text('$day', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({required this.task, required this.onClaim});

  final DailyTask task;
  final VoidCallback onClaim;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final type = task.type;
    final money = type == TaskType.earnTickets;
    return ChunkyCard(
      depth: 3,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconBubble(icon: _icon(type), palette: _palette(type), size: 38),
              const SizedBox(width: GameDimens.spaceM),
              Expanded(
                child: Text(_title(l10n, type), style: Theme.of(context).textTheme.titleMedium),
              ),
            ],
          ),
          const SizedBox(height: GameDimens.spaceS),
          ChunkyProgressBar(
            value: task.progress / type.target,
            palette: ChunkyPalette.lagoon,
            height: 16,
            label: l10n.dailyProgress(
              money ? MoneyFormat.compact(task.progress) : '${task.progress}',
              money ? MoneyFormat.compact(type.target) : '${type.target}',
            ),
          ),
          const SizedBox(height: GameDimens.spaceS),
          Row(
            children: [
              GameTag(
                label: l10n.dailyReward(MoneyFormat.compact(type.money), type.xp),
                palette: ChunkyPalette.sunny,
              ),
              const Spacer(),
              task.claimed
                  ? GameTag(
                      label: l10n.dailyClaimed,
                      palette: ChunkyPalette.green,
                      icon: Icons.check_rounded,
                    )
                  : ChunkyButton(
                      label: l10n.dailyClaim,
                      size: ChunkySize.small,
                      onPressed: task.done ? onClaim : null,
                    ),
            ],
          ),
        ],
      ),
    );
  }

  String _title(AppLocalizations l10n, TaskType type) => switch (type) {
    TaskType.buyBuses => l10n.taskBuyBuses(type.target),
    TaskType.makeDecisions => l10n.taskMakeDecisions(type.target),
    TaskType.runDays => l10n.taskRunDays(type.target),
    TaskType.earnTickets => l10n.taskEarnTickets(MoneyFormat.compact(type.target)),
    TaskType.finishProject => l10n.taskFinishProject,
    TaskType.repairRoad => l10n.taskRepairRoad,
    TaskType.reachSatisfaction => l10n.taskReachSatisfaction(type.target),
  };

  IconData _icon(TaskType type) => switch (type) {
    TaskType.buyBuses => Icons.directions_bus_rounded,
    TaskType.makeDecisions => Icons.how_to_vote_rounded,
    TaskType.runDays => Icons.calendar_month_rounded,
    TaskType.earnTickets => Icons.confirmation_number_rounded,
    TaskType.finishProject => Icons.construction_rounded,
    TaskType.repairRoad => Icons.add_road_rounded,
    TaskType.reachSatisfaction => Icons.favorite_rounded,
  };

  ChunkyPalette _palette(TaskType type) => switch (type) {
    TaskType.buyBuses => ChunkyPalette.ocean,
    TaskType.makeDecisions => ChunkyPalette.sunny,
    TaskType.runDays => ChunkyPalette.grape,
    TaskType.earnTickets => ChunkyPalette.green,
    TaskType.finishProject || TaskType.repairRoad => ChunkyPalette.tangerine,
    TaskType.reachSatisfaction => ChunkyPalette.bubblegum,
  };
}
