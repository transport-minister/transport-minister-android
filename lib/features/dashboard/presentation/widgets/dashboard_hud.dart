import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/diplomacy/presentation/diplomacy_texts.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/presentation/widgets/rank_insignia.dart';
import 'package:transport_minister/features/tutorial/presentation/tutorial_overlay.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DashboardHud extends StatelessWidget {
  const DashboardHud({
    super.key,
    required this.city,
    required this.rank,
    required this.onProfilePressed,
    required this.onDiplomacyPressed,
    required this.onSettingsPressed,
    this.targets,
  });

  final CityState city;
  final MinisterialRank rank;
  final VoidCallback onProfilePressed;
  final VoidCallback onDiplomacyPressed;
  final VoidCallback onSettingsPressed;
  final TutorialTargets? targets;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
              pressedScale: 0.9,
              builder: (context, pressed) => KeyedSubtree(
                key: targets?.rank,
                child: RankInsignia(rank: rank, size: 46),
              ),
            ),
            const SizedBox(width: GameDimens.spaceM),
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
                        label: l10n.hudDiplomacyLabel,
                        child: StatPill(
                          icon: DiplomacyStyle.icon,
                          value: '${city.diplomacyPoints}',
                          palette: DiplomacyStyle.palette,
                          onPressed: onDiplomacyPressed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: GameDimens.spaceS),
            ChunkyIconButton(
              icon: Icons.settings_rounded,
              semanticsLabel: l10n.settingsOpen,
              onPressed: onSettingsPressed,
            ),
          ],
        ),
      ),
    );
  }
}
