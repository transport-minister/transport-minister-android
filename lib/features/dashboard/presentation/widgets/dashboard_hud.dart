import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/day_clock_badge.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/presentation/widgets/rank_insignia.dart';
import 'package:transport_minister/features/tutorial/presentation/tutorial_overlay.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DashboardHud extends StatelessWidget {
  const DashboardHud({
    super.key,
    required this.city,
    required this.rank,
    required this.dayProgress,
    required this.onProfilePressed,
    this.targets,
  });

  final CityState city;
  final MinisterialRank rank;
  final double dayProgress;
  final VoidCallback onProfilePressed;
  final TutorialTargets? targets;

  static ChunkyPalette satisfactionPalette(double value) {
    if (value >= 60) {
      return ChunkyPalette.green;
    }
    return value >= 40 ? ChunkyPalette.sunny : ChunkyPalette.coral;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final satisfaction = city.overallSatisfaction;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          GameDimens.spaceL,
          GameDimens.spaceS,
          GameDimens.spaceL,
          GameDimens.spaceS,
        ),
        child: Row(
          children: [
            PressableBuilder(
              onPressed: onProfilePressed,
              semanticsLabel: l10n.profileOpen,
              builder: (context, pressed) => AnimatedScale(
                scale: pressed ? 0.9 : 1,
                duration: GameDimens.pressDuration,
                child: KeyedSubtree(
                  key: targets?.rank,
                  child: RankInsignia(rank: rank, size: 46),
                ),
              ),
            ),
            const SizedBox(width: GameDimens.spaceM),
            KeyedSubtree(
              key: targets?.clock,
              child: DayClockBadge(
                day: city.day,
                progress: dayProgress,
                label: l10n.hudDay(city.day),
              ),
            ),
            const SizedBox(width: GameDimens.spaceS),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      Semantics(
                        key: targets?.budget,
                        label: l10n.hudBudgetLabel,
                        child: StatPill(
                          icon: Icons.account_balance_wallet_rounded,
                          value: MoneyFormat.compact(city.budget),
                          palette: city.budget < 0 ? ChunkyPalette.coral : ChunkyPalette.green,
                        ),
                      ),
                      const SizedBox(width: GameDimens.spaceS),
                      Semantics(
                        key: targets?.mood,
                        label: l10n.hudSatisfactionLabel,
                        child: StatPill(
                          icon: Icons.favorite_rounded,
                          value: l10n.hudSatisfaction(satisfaction.round()),
                          palette: satisfactionPalette(satisfaction),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
