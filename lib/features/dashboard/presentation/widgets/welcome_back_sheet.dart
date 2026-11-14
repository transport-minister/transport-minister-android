import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/features/city_game/domain/welcome_back.dart';
import 'package:transport_minister/features/city_game/presentation/time_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class WelcomeBackSheet extends StatelessWidget {
  const WelcomeBackSheet({
    super.key,
    required this.cityName,
    required this.welcome,
    required this.onCollect,
    this.onCollectDouble,
  });

  final String cityName;
  final WelcomeBack welcome;
  final VoidCallback onCollect;
  final VoidCallback? onCollectDouble;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final earnings = MoneyFormat.compact(welcome.earnings);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MrBusSays(
          mood: MrBusMood.excited,
          title: l10n.welcomeTitle,
          message: l10n.welcomeBody(TimeTexts.duration(l10n, welcome.awaySeconds), cityName),
        ),
        const SizedBox(height: GameDimens.spaceL),
        Center(
          child: StatPill(
            icon: Icons.account_balance_wallet_rounded,
            value: '+$earnings',
            palette: ChunkyPalette.green,
          ),
        ),
        const SizedBox(height: GameDimens.spaceXL),
        if (onCollectDouble case final collectDouble?) ...[
          ChunkyButton(
            label: l10n.welcomeCollectDouble(MoneyFormat.compact(welcome.earnings * 2)),
            icon: Icons.play_circle_rounded,
            palette: ChunkyPalette.sunny,
            size: ChunkySize.large,
            expanded: true,
            onPressed: collectDouble,
          ),
          const SizedBox(height: GameDimens.spaceM),
          ChunkyButton(
            label: l10n.welcomeCollect(earnings),
            palette: ChunkyPalette.snow,
            expanded: true,
            onPressed: onCollect,
          ),
        ] else
          ChunkyButton(
            label: l10n.welcomeCollect(earnings),
            icon: Icons.savings_rounded,
            size: ChunkySize.large,
            expanded: true,
            onPressed: onCollect,
          ),
      ],
    );
  }
}
