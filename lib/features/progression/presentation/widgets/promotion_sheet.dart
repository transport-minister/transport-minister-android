import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/widgets/sticker_text.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/presentation/ministerial_rank_text.dart';
import 'package:transport_minister/features/progression/presentation/widgets/rank_insignia.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class PromotionSheet extends StatelessWidget {
  const PromotionSheet({super.key, required this.rank});

  final MinisterialRank rank;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StickerText(l10n.promotedTitle, fontSize: 40, color: ChunkyPalette.sunny.face),
        const SizedBox(height: GameDimens.spaceL),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MrBus(mood: MrBusMood.excited, size: 84),
            const SizedBox(width: GameDimens.spaceL),
            RankInsignia(rank: rank, size: 96),
          ],
        ),
        const SizedBox(height: GameDimens.spaceL),
        Text(
          l10n.promotedBody(rank.title(l10n)),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: GameDimens.spaceXL),
        ChunkyButton(
          label: l10n.promotedContinue,
          icon: Icons.military_tech_rounded,
          palette: ChunkyPalette.grape,
          size: ChunkySize.large,
          expanded: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
