import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/features/advisor/domain/advisor.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class AdvisorSheet extends StatelessWidget {
  const AdvisorSheet({super.key, required this.tip, required this.onShowDistrict});

  final AdvisorTip tip;
  final VoidCallback onShowDistrict;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MrBusSays(title: l10n.advisorTitle, message: _message(l10n), mood: _mood, mascotSize: 96),
        const SizedBox(height: GameDimens.spaceXL),
        if (tip.district != null) ...[
          ChunkyButton(
            label: l10n.advisorShowMe,
            icon: Icons.near_me_rounded,
            palette: ChunkyPalette.ocean,
            expanded: true,
            onPressed: () {
              Navigator.of(context).pop();
              onShowDistrict();
            },
          ),
          const SizedBox(height: GameDimens.spaceM),
        ],
        ChunkyButton(
          label: l10n.commonGotIt,
          palette: tip.district == null ? ChunkyPalette.green : ChunkyPalette.snow,
          expanded: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  MrBusMood get _mood => switch (tip.kind) {
    TipKind.negativeBudget || TipKind.presidentWatching => MrBusMood.shocked,
    TipKind.allGood => MrBusMood.happy,
    TipKind.longWaits ||
    TipKind.brokenRoads ||
    TipKind.trafficJam ||
    TipKind.oldFleet => MrBusMood.worried,
  };

  String _message(AppLocalizations l10n) {
    final district = tip.district?.displayName(l10n) ?? '';
    return switch (tip.kind) {
      TipKind.negativeBudget => l10n.tipNegativeBudget,
      TipKind.presidentWatching => l10n.tipPresidentWatching,
      TipKind.longWaits => l10n.tipLongWaits(district, tip.value),
      TipKind.brokenRoads => l10n.tipBrokenRoads(district, tip.value),
      TipKind.trafficJam => l10n.tipTrafficJam(district),
      TipKind.oldFleet => l10n.tipOldFleet,
      TipKind.allGood => l10n.tipAllGood,
    };
  }
}

class MrBusButton extends StatelessWidget {
  const MrBusButton({super.key, required this.onPressed, this.urgent = false, this.news = 0});

  final VoidCallback onPressed;
  final bool urgent;
  final int news;

  @override
  Widget build(BuildContext context) {
    final mood = urgent ? MrBusMood.shocked : (news > 0 ? MrBusMood.excited : MrBusMood.happy);
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: AppLocalizations.of(context).advisorTitle,
      pressedScale: 0.9,
      builder: (context, pressed) => Stack(
        clipBehavior: Clip.none,
        children: [
          MrBus(mood: mood, size: 64),
          if (news > 0 || urgent)
            Positioned(
              right: -4,
              top: -2,
              child: Container(
                constraints: const BoxConstraints(minWidth: 24),
                height: 24,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: ChunkyPalette.coral.face,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
                ),
                child: Text(
                  news > 0 ? '$news' : '!',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: GameColors.paper,
                    height: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
