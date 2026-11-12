import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/features/city_game/presentation/crisis_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CrisisBanner extends StatelessWidget {
  const CrisisBanner({super.key, required this.crisis});

  final CrisisState crisis;

  @override
  Widget build(BuildContext context) {
    if (crisis.seconds == 0) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context);
    final cause = crisis.cause ?? CrisisCause.unhappy;
    final warned = crisis.warnings > 0;
    final palette = warned ? ChunkyPalette.coral : ChunkyPalette.tangerine;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GameDimens.spaceL,
        0,
        GameDimens.spaceL,
        GameDimens.spaceS,
      ),
      child: ChunkyCard(
        color: palette.face,
        depth: 3,
        radius: GameDimens.radiusM,
        padding: const EdgeInsets.symmetric(
          horizontal: GameDimens.spaceM,
          vertical: GameDimens.spaceS,
        ),
        child: Row(
          children: [
            Icon(warned ? Icons.gavel_rounded : cause.icon, color: GameColors.paper),
            const SizedBox(width: GameDimens.spaceS),
            Expanded(
              child: Text(
                warned ? cause.warning(l10n, crisis.warnings) : cause.alert(l10n),
                style: const TextStyle(
                  color: GameColors.paper,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
