import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/model/daily_report.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DailyReportCard extends StatelessWidget {
  const DailyReportCard({super.key, required this.report});

  final DailyReport? report;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final current = report;
    return ChunkyCard(
      onPressed: current == null ? null : () => _showLedger(context, current),
      semanticsLabel: l10n.reportTitle,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: current == null
          ? Row(
              children: [
                const IconBubble(icon: Icons.receipt_long_rounded, palette: ChunkyPalette.sunny),
                const SizedBox(width: GameDimens.spaceM),
                Expanded(child: Text(l10n.reportEmpty, style: textTheme.bodyMedium)),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const IconBubble(
                      icon: Icons.receipt_long_rounded,
                      palette: ChunkyPalette.sunny,
                      size: 34,
                    ),
                    const SizedBox(width: GameDimens.spaceS),
                    Expanded(child: Text(l10n.reportTitle, style: textTheme.titleMedium)),
                    _AmountTag(
                      text: l10n.reportNet(MoneyFormat.signed(current.operatingResult)),
                      positive: current.operatingResult >= 0,
                    ),
                  ],
                ),
                const SizedBox(height: GameDimens.spaceS),
                for (final entry in _topLines(current).take(3))
                  _LedgerLine(item: entry.key, amount: entry.value),
              ],
            ),
    );
  }

  static List<MapEntry<LedgerItem, int>> _topLines(DailyReport report) {
    return report.ledger.entries.toList()..sort((a, b) => b.value.abs().compareTo(a.value.abs()));
  }

  void _showLedger(BuildContext context, DailyReport report) {
    final l10n = AppLocalizations.of(context);
    showChunkySheet<void>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.reportSheetTitle(report.day), style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: GameDimens.spaceM),
          for (final entry in _topLines(report)) _LedgerLine(item: entry.key, amount: entry.value),
          const Divider(),
          Text(
            l10n.reportBudgetAfter(MoneyFormat.compact(report.budget)),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _LedgerLine extends StatelessWidget {
  const _LedgerLine({required this.item, required this.amount});

  final LedgerItem item;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(child: Text(item.label(l10n), style: Theme.of(context).textTheme.bodyMedium)),
          Text(
            MoneyFormat.signed(amount),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: amount >= 0 ? ChunkyPalette.green.deep : ChunkyPalette.coral.deep,
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountTag extends StatelessWidget {
  const _AmountTag({required this.text, required this.positive});

  final String text;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    return GameTag(
      label: text,
      palette: positive ? ChunkyPalette.green : ChunkyPalette.coral,
      icon: positive ? Icons.trending_up_rounded : Icons.trending_down_rounded,
    );
  }
}
