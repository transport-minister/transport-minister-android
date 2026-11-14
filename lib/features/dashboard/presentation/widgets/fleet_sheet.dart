import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/fleet_advisor.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/features/decisions/presentation/decision_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class FleetSheet extends ConsumerWidget {
  const FleetSheet({super.key, required this.cityId, required this.onOpenDistrict});

  final CityId cityId;
  final ValueChanged<DistrictId> onOpenDistrict;

  static const _advisor = FleetAdvisor();
  static const _commands = CityCommands();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final city = ref.watch(cityGameProvider(cityId)).value?.city;
    if (city == null) {
      return const SizedBox.shrink();
    }
    final metrics = const MetricsCalculator().calculate(city);
    final model = _advisor.bestModel(city);
    final districts = [...metrics.districts]
      ..sort((a, b) => a.serviceRatio.compareTo(b.serviceRatio));
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: Text(l10n.fleetSheetTitle, style: textTheme.headlineSmall)),
                GameTag(
                  label: l10n.depotSpace(city.fleet.length, city.depotCapacity),
                  palette: ChunkyPalette.grape,
                  icon: Icons.warehouse_rounded,
                ),
              ],
            ),
            const SizedBox(height: GameDimens.spaceXS),
            Text(l10n.fleetSheetBody, style: textTheme.bodySmall),
            const SizedBox(height: GameDimens.spaceM),
            for (final district in districts) ...[
              ChunkyCard(
                depth: 3,
                padding: const EdgeInsets.all(GameDimens.spaceM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        PressableBuilder(
                          onPressed: () => onOpenDistrict(district.id),
                          semanticsLabel: district.id.displayName(l10n),
                          pressedScale: 0.9,
                          builder: (context, pressed) => IconBubble(
                            icon: district.id.icon,
                            palette: district.id.palette,
                            size: 40,
                          ),
                        ),
                        const SizedBox(width: GameDimens.spaceM),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(district.id.displayName(l10n), style: textTheme.titleMedium),
                              Text(
                                l10n.fleetDistrictLine(district.buses),
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        WaitChip(
                          minutes: district.waitingMinutes.round(),
                          label: l10n.statMinutes(district.waitingMinutes.round()),
                        ),
                      ],
                    ),
                    const SizedBox(height: GameDimens.spaceS),
                    ChunkyProgressBar(
                      value: district.serviceRatio,
                      palette: district.serviceRatio < FleetAdvisor.needsBusesBelow
                          ? ChunkyPalette.coral
                          : ChunkyPalette.ocean,
                      height: 12,
                    ),
                    const SizedBox(height: GameDimens.spaceS),
                    ChunkyButton(
                      label: l10n.fleetAddBus(
                        model.label(l10n),
                        MoneyFormat.compact(model.spec.price),
                      ),
                      icon: Icons.add_rounded,
                      palette: ChunkyPalette.ocean,
                      size: ChunkySize.small,
                      expanded: true,
                      onPressed: _commands.purchaseProblem(city, model) == null
                          ? () => ref
                                .read(cityGameProvider(cityId).notifier)
                                .perform(
                                  (state) =>
                                      _commands.buyBus(state, model: model, district: district.id),
                                )
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: GameDimens.spaceS),
            ],
          ],
        ),
      ),
    );
  }
}
