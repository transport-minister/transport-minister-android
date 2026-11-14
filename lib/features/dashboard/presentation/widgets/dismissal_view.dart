import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/features/city_game/presentation/crisis_texts.dart';
import 'package:transport_minister/features/diamonds/presentation/diamond_button.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DismissalView extends StatelessWidget {
  const DismissalView({
    super.key,
    required this.cause,
    required this.continueCost,
    required this.onContinue,
    required this.onRestart,
  });

  final CrisisCause? cause;
  final int continueCost;
  final VoidCallback onContinue;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(GameDimens.spaceXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: IconBubble(icon: Icons.gavel_rounded, palette: ChunkyPalette.coral, size: 96),
            ),
            const SizedBox(height: GameDimens.spaceXL),
            Text(l10n.dismissedTitle, textAlign: TextAlign.center, style: textTheme.headlineMedium),
            const SizedBox(height: GameDimens.spaceS),
            Text(
              l10n.dismissedBody((cause ?? CrisisCause.unhappy).dismissal(l10n)),
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(color: GameColors.inkSoft),
            ),
            const SizedBox(height: GameDimens.spaceXL),
            Text(
              l10n.dismissedContinueHint(continueCost),
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: GameDimens.spaceM),
            DiamondButton(
              label: l10n.boostContinue,
              cost: continueCost,
              size: ChunkySize.large,
              expanded: true,
              onPressed: onContinue,
            ),
            const SizedBox(height: GameDimens.spaceM),
            ChunkyButton(
              label: l10n.dismissedRestart,
              icon: Icons.refresh_rounded,
              palette: ChunkyPalette.snow,
              expanded: true,
              onPressed: onRestart,
            ),
          ],
        ),
      ),
    );
  }
}
