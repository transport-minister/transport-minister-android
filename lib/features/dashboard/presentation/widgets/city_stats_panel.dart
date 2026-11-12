import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CityStatsPanel extends StatelessWidget {
  const CityStatsPanel({
    super.key,
    required this.income,
    required this.population,
    required this.satisfaction,
    this.moodKey,
  });

  final int income;
  final int population;
  final double satisfaction;
  final Key? moodKey;

  static ChunkyPalette satisfactionPalette(double value) {
    if (value >= 60) {
      return ChunkyPalette.green;
    }
    return value >= 40 ? ChunkyPalette.sunny : ChunkyPalette.coral;
  }

  static IconData satisfactionIcon(double value) {
    if (value >= 60) {
      return Icons.sentiment_very_satisfied_rounded;
    }
    return value >= 40 ? Icons.sentiment_neutral_rounded : Icons.sentiment_dissatisfied_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final earning = income >= 0;
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, GameDimens.spaceS, 5),
      decoration: BoxDecoration(
        color: GameColors.paper,
        borderRadius: BorderRadius.circular(GameDimens.radiusM),
        border: Border.all(color: GameColors.ink, width: GameDimens.outline),
        boxShadow: const [BoxShadow(color: GameColors.ink, offset: Offset(0, 3))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatRow(
            icon: earning ? Icons.trending_up_rounded : Icons.trending_down_rounded,
            palette: earning ? ChunkyPalette.green : ChunkyPalette.coral,
            value: l10n.statIncome(MoneyFormat.signedShort(income)),
            label: l10n.hudIncomeLabel,
          ),
          const SizedBox(height: GameDimens.spaceXS),
          _StatRow(
            icon: Icons.groups_rounded,
            palette: ChunkyPalette.ocean,
            value: MoneyFormat.count(population),
            label: l10n.hudPopulationLabel,
          ),
          const SizedBox(height: GameDimens.spaceXS),
          _StatRow(
            key: moodKey,
            icon: satisfactionIcon(satisfaction),
            palette: satisfactionPalette(satisfaction),
            value: l10n.hudSatisfaction(satisfaction.round()),
            label: l10n.hudSatisfactionLabel,
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    super.key,
    required this.icon,
    required this.palette,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final ChunkyPalette palette;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      value: value,
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconBubble(icon: icon, palette: palette, size: 26),
          const SizedBox(width: 6),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 1)),
        ],
      ),
    );
  }
}
