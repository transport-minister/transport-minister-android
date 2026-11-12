import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/bus_performance.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/features/city_game/presentation/bus_model_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_panel_parts.dart';
import 'package:transport_minister/features/decisions/presentation/decision_texts.dart';
import 'package:transport_minister/features/technology/presentation/technology_texts.dart';
import 'package:transport_minister/features/tutorial/application/tutorial_controller.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DistrictBusesTab extends StatelessWidget {
  const DistrictBusesTab({
    super.key,
    required this.city,
    required this.metrics,
    required this.district,
    required this.guided,
    required this.onAction,
    required this.onOpenTechnology,
  });

  final CityState city;
  final CityMetrics metrics;
  final DistrictId district;
  final bool guided;
  final DistrictAction onAction;
  final VoidCallback onOpenTechnology;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onOrder = city.fleet
        .where((bus) => bus.districtId == district && !bus.isActiveOn(city.day))
        .length;
    final groups = _groups();
    final donor = _donor();
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: panelBottomSpace),
      sliver: SliverList.list(
        children: [
          if (guided) ...[
            MrBusSays(
              message: l10n.tutorialBuyBus(MoneyFormat.compact(TutorialController.welcomeGift)),
              mood: MrBusMood.excited,
              mascotSize: 56,
            ),
            const SizedBox(height: GameDimens.spaceM),
          ],
          PanelSectionTitle(
            title: l10n.contractsTitle,
            trailing: GameTag(
              label: l10n.depotSpace(city.fleet.length, city.depotCapacity),
              palette: ChunkyPalette.grape,
              icon: Icons.warehouse_rounded,
            ),
          ),
          for (final model in _contractOrder()) ...[
            _ContractCard(
              key: ValueKey(model),
              model: model,
              city: city,
              onOpenTechnology: onOpenTechnology,
              onSign: (count) => onAction(
                (city) => const CityCommands().buyBuses(
                  city,
                  model: model,
                  district: district,
                  count: count,
                ),
              ),
            ),
            const SizedBox(height: GameDimens.spaceS),
          ],
          const SizedBox(height: GameDimens.spaceM),
          PanelSectionTitle(
            title: l10n.fleetHereTitle,
            trailing: onOrder > 0
                ? GameTag(
                    label: l10n.fleetOnOrder(onOrder),
                    palette: ChunkyPalette.sunny,
                    icon: Icons.local_shipping_rounded,
                  )
                : null,
          ),
          if (groups.isEmpty) Text(l10n.fleetEmpty, style: Theme.of(context).textTheme.bodySmall),
          for (final group in groups) ...[
            _FleetCard(buses: group, city: city, onAction: onAction),
            const SizedBox(height: GameDimens.spaceS),
          ],
          if (donor != null) ...[
            const SizedBox(height: GameDimens.spaceS),
            ChunkyButton(
              label: l10n.fleetMoveHere(donor.displayName(l10n)),
              icon: Icons.swap_horiz_rounded,
              palette: ChunkyPalette.sunny,
              size: ChunkySize.small,
              expanded: true,
              onPressed: () => onAction(
                (city) =>
                    const CityCommands().reassignBus(city, city.busesIn(donor).first.id, district),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Iterable<BusModelId> _contractOrder() {
    final byPrice = [...BusModelId.values]..sort((a, b) => a.spec.price.compareTo(b.spec.price));
    final available = byPrice.where((model) => city.has(TechnologyId.forModel(model)));
    return available.followedBy(byPrice.where((model) => !available.contains(model)));
  }

  List<List<Bus>> _groups() {
    final groups = <(BusModelId, int), List<Bus>>{};
    for (final bus in city.busesIn(district)) {
      groups.putIfAbsent((bus.model, bus.level), () => []).add(bus);
    }
    final keys = groups.keys.toList()
      ..sort((a, b) => a.$1 == b.$1 ? b.$2.compareTo(a.$2) : a.$1.index.compareTo(b.$1.index));
    return [for (final key in keys) groups[key]!];
  }

  DistrictId? _donor() {
    final here = metrics.of(district).serviceRatio;
    final donors = metrics.districts.where(
      (other) => other.id != district && other.buses >= 2 && other.serviceRatio > here,
    );
    if (donors.isEmpty) {
      return null;
    }
    return donors.reduce((best, other) => other.serviceRatio > best.serviceRatio ? other : best).id;
  }
}

class _ContractCard extends StatefulWidget {
  const _ContractCard({
    super.key,
    required this.model,
    required this.city,
    required this.onSign,
    required this.onOpenTechnology,
  });

  final BusModelId model;
  final CityState city;
  final ValueChanged<int> onSign;
  final VoidCallback onOpenTechnology;

  @override
  State<_ContractCard> createState() => _ContractCardState();
}

class _ContractCardState extends State<_ContractCard> {
  static const _maxOrder = 5;

  var _count = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final model = widget.model;
    final spec = model.spec;
    final technology = TechnologyId.forModel(model);
    final locked = !widget.city.has(technology);
    final problem = const CityCommands().purchaseProblem(widget.city, model, count: _count);
    return ChunkyCard(
      depth: 3,
      color: locked ? GameColors.sand : GameColors.paper,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBubble(
                icon: locked ? Icons.lock_rounded : model.icon,
                palette: locked ? ChunkyPalette.stone : model.palette,
                size: 44,
              ),
              const SizedBox(width: GameDimens.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.label(l10n), style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: GameDimens.spaceXS),
                    Wrap(
                      spacing: GameDimens.spaceM,
                      runSpacing: GameDimens.spaceXS,
                      children: [
                        _Spec(icon: Icons.event_seat_rounded, label: l10n.busSeats(spec.capacity)),
                        _Spec(
                          icon: Icons.payments_rounded,
                          label: l10n.busRunningCost(MoneyFormat.compact(model.runningCostPerDay)),
                        ),
                        _Spec(
                          icon: Icons.sentiment_satisfied_rounded,
                          label: l10n.busComfort(spec.comfort.round()),
                        ),
                        _Spec(icon: Icons.eco_rounded, label: model.eco(l10n)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: GameDimens.spaceS),
          if (technology != null && locked)
            Row(
              children: [
                const Icon(Icons.lock_rounded, size: 16, color: GameColors.inkSoft),
                const SizedBox(width: GameDimens.spaceXS),
                Expanded(
                  child: Text(
                    l10n.technologyRequires(technology.label(l10n)),
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                ChunkyButton(
                  label: l10n.contractOpenTechnology,
                  icon: Icons.science_rounded,
                  palette: ChunkyPalette.lagoon,
                  size: ChunkySize.small,
                  onPressed: widget.onOpenTechnology,
                ),
              ],
            )
          else ...[
            Row(
              children: [
                _Stepper(
                  count: _count,
                  max: _maxOrder,
                  onChanged: (count) => setState(() => _count = count),
                ),
                const SizedBox(width: GameDimens.spaceS),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ChunkyButton(
                      label: l10n.contractSign(MoneyFormat.compact(spec.price * _count)),
                      icon: Icons.draw_rounded,
                      size: ChunkySize.small,
                      onPressed: problem == null ? () => widget.onSign(_count) : null,
                    ),
                  ),
                ),
              ],
            ),
            if (problem != null) ProblemText(problem.message(l10n)),
          ],
        ],
      ),
    );
  }
}

class _Spec extends StatelessWidget {
  const _Spec({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: GameColors.inkSoft),
        const SizedBox(width: 3),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({required this.count, required this.max, required this.onChanged});

  final int count;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChunkyIconButton(
          icon: Icons.remove_rounded,
          size: 36,
          semanticsLabel: l10n.contractFewer,
          onPressed: count > 1 ? () => onChanged(count - 1) : null,
        ),
        SizedBox(
          width: 34,
          child: Text(
            '$count',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ChunkyIconButton(
          icon: Icons.add_rounded,
          size: 36,
          semanticsLabel: l10n.contractMore,
          onPressed: count < max ? () => onChanged(count + 1) : null,
        ),
      ],
    );
  }
}

class _FleetCard extends StatelessWidget {
  const _FleetCard({required this.buses, required this.city, required this.onAction});

  final List<Bus> buses;
  final CityState city;
  final DistrictAction onAction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    const commands = CityCommands();
    final sample = buses.first;
    final model = sample.model;
    final next = sample.level + 1;
    final reliability =
        buses.fold(0.0, (sum, bus) => sum + BusPerformance.of(bus).reliability) / buses.length;
    final oldest = buses.reduce((a, b) => b.ageDays > a.ageDays ? b : a);
    final resale = MoneyFormat.compact(BusPerformance.resaleValue(oldest));
    final problem = commands.upgradeProblem(city, sample);
    final maxed = problem == RejectionReason.maxLevelReached;
    final technology = TechnologyId.forUpgradeLevel(next);
    return ChunkyCard(
      depth: 3,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconBubble(icon: model.icon, palette: model.palette, size: 40),
              const SizedBox(width: GameDimens.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.fleetGroup(buses.length, model.label(l10n)),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      l10n.fleetLevel(sample.level, (reliability * 100).round()),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: GameDimens.spaceS),
          Row(
            children: [
              Expanded(
                child: maxed
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: GameTag(
                          label: l10n.fleetMaxLevel,
                          palette: ChunkyPalette.green,
                          icon: Icons.star_rounded,
                        ),
                      )
                    : ChunkyButton(
                        label: l10n.fleetUpgrade(
                          MoneyFormat.compact(BusUpgrades.costToReach(model, next)),
                        ),
                        palette: ChunkyPalette.ocean,
                        size: ChunkySize.small,
                        expanded: true,
                        onPressed: problem == null
                            ? () => onAction((city) => commands.upgradeBus(city, sample.id))
                            : null,
                      ),
              ),
              const SizedBox(width: GameDimens.spaceS),
              Expanded(
                child: ChunkyButton(
                  label: l10n.fleetSell(resale),
                  palette: ChunkyPalette.coral,
                  size: ChunkySize.small,
                  expanded: true,
                  onPressed: () => onAction((city) => commands.sellBus(city, oldest.id)),
                ),
              ),
            ],
          ),
          if (problem != null && !maxed)
            ProblemText(
              technology != null && problem == RejectionReason.locked
                  ? l10n.technologyRequires(technology.label(l10n))
                  : problem.message(l10n),
            ),
        ],
      ),
    );
  }
}
