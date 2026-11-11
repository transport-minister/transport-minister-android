import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DistrictStrip extends StatelessWidget {
  const DistrictStrip({super.key, required this.metrics, required this.onDistrictPressed});

  final CityMetrics metrics;
  final ValueChanged<DistrictId> onDistrictPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final districts = [...DistrictId.values]
      ..sort((a, b) => metrics.of(b).waitingMinutes.compareTo(metrics.of(a).waitingMinutes));
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: GameDimens.spaceL),
        itemCount: districts.length,
        separatorBuilder: (context, index) => const SizedBox(width: GameDimens.spaceS),
        itemBuilder: (context, index) {
          final district = districts[index];
          final waiting = metrics.of(district).waitingMinutes.round();
          return ChunkyCard(
            onPressed: () => onDistrictPressed(district),
            semanticsLabel: district.displayName(l10n),
            depth: 3,
            radius: GameDimens.radiusM,
            padding: const EdgeInsets.fromLTRB(4, 3, 10, 3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconBubble(icon: district.icon, palette: district.palette, size: 28),
                const SizedBox(width: 6),
                Text(
                  district.displayName(l10n),
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 6),
                WaitChip(minutes: waiting, label: l10n.statMinutes(waiting)),
              ],
            ),
          );
        },
      ),
    );
  }
}
