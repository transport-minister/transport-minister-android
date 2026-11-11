import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/features/city_game/application/away_summary.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class AwaySummarySheet extends StatelessWidget {
  const AwaySummarySheet({super.key, required this.summary});

  final AwaySummary summary;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final satisfaction = summary.satisfactionChange;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: IconBubble(icon: Icons.wb_sunny_rounded, palette: ChunkyPalette.sunny, size: 72),
        ),
        const SizedBox(height: GameDimens.spaceM),
        Text(l10n.awayTitle, textAlign: TextAlign.center, style: textTheme.headlineSmall),
        Text(
          l10n.awayDays(summary.days),
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(color: GameColors.inkSoft),
        ),
        if (summary.capped)
          Text(l10n.awayCapped, textAlign: TextAlign.center, style: textTheme.bodySmall),
        const SizedBox(height: GameDimens.spaceL),
        _Row(
          icon: Icons.account_balance_wallet_rounded,
          palette: ChunkyPalette.green,
          label: l10n.awayBudget,
          value: MoneyFormat.signed(summary.budgetChange),
        ),
        _Row(
          icon: Icons.favorite_rounded,
          palette: ChunkyPalette.bubblegum,
          label: l10n.awaySatisfaction,
          value: '${satisfaction >= 0 ? '+' : ''}${satisfaction.toStringAsFixed(1)}%',
        ),
        _Row(
          icon: Icons.directions_bus_rounded,
          palette: ChunkyPalette.ocean,
          label: l10n.awayBusesDelivered,
          value: '${summary.busesDelivered}',
        ),
        _Row(
          icon: Icons.construction_rounded,
          palette: ChunkyPalette.tangerine,
          label: l10n.awayProjectsCompleted,
          value: '${summary.projectsCompleted}',
        ),
        const SizedBox(height: GameDimens.spaceXL),
        ChunkyButton(
          label: l10n.awayContinue,
          expanded: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.icon, required this.palette, required this.label, required this.value});

  final IconData icon;
  final ChunkyPalette palette;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GameDimens.spaceXS),
      child: Row(
        children: [
          IconBubble(icon: icon, palette: palette, size: 34),
          const SizedBox(width: GameDimens.spaceM),
          Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
