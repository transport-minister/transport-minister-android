import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/illustrations/city_skyline.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/features/progression/domain/city_badge.dart';
import 'package:transport_minister/features/progression/presentation/progression_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CityBadgeMedal extends StatelessWidget {
  const CityBadgeMedal({super.key, required this.city, required this.tier});

  final CityId city;
  final BadgeTier? tier;

  static const size = 70.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final earned = tier;
    return SizedBox(
      width: size + 12,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: earned?.color ?? GameColors.sand,
              border: Border.all(color: GameColors.ink, width: GameDimens.outline),
              boxShadow: const [BoxShadow(color: GameColors.ink, offset: Offset(0, 3))],
            ),
            child: ClipOval(
              child: ColorFiltered(
                colorFilter: earned == null
                    ? const ColorFilter.matrix([
                        0.33,
                        0.33,
                        0.33,
                        0,
                        0,
                        0.33,
                        0.33,
                        0.33,
                        0,
                        0,
                        0.33,
                        0.33,
                        0.33,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ])
                    : const ColorFilter.mode(Colors.transparent, BlendMode.dst),
                child: CitySkyline(scene: city.scene),
              ),
            ),
          ),
          const SizedBox(height: GameDimens.spaceXS),
          Text(
            city.displayName(l10n),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
          Text(
            earned?.label(l10n) ?? l10n.badgeLocked,
            style: const TextStyle(fontSize: 11, color: GameColors.inkSoft),
          ),
        ],
      ),
    );
  }
}
