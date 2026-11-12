import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class TrafficMeter extends StatelessWidget {
  const TrafficMeter({super.key, required this.congestion, required this.onPressed});

  final double congestion;
  final VoidCallback onPressed;

  static const _warningMargin = 10.0;

  static bool isNearGridlock(double congestion) =>
      congestion >= GameBalance.gridlockCongestion - _warningMargin;

  static ChunkyPalette paletteFor(double congestion) {
    if (congestion >= GameBalance.gridlockCongestion) {
      return ChunkyPalette.coral;
    }
    return isNearGridlock(congestion) ? ChunkyPalette.sunny : ChunkyPalette.lagoon;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      label: l10n.trafficMeterLabel,
      child: StatPill(
        icon: Icons.traffic_rounded,
        value: l10n.statPercent(congestion.round()),
        palette: paletteFor(congestion),
        onPressed: onPressed,
      ),
    );
  }
}

class TrafficSheet extends StatelessWidget {
  const TrafficSheet({super.key, required this.congestion});

  final double congestion;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconBubble(
              icon: Icons.traffic_rounded,
              palette: TrafficMeter.paletteFor(congestion),
              size: 52,
            ),
            const SizedBox(width: GameDimens.spaceM),
            Expanded(
              child: Text(
                l10n.trafficInfoTitle(congestion.round()),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: GameDimens.spaceL),
        MrBusSays(
          message: l10n.trafficInfoBody(GameBalance.gridlockCongestion.round()),
          mood: TrafficMeter.isNearGridlock(congestion) ? MrBusMood.worried : MrBusMood.thinking,
          mascotSize: 64,
        ),
      ],
    );
  }
}
