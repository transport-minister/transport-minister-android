import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/features/city_game/application/city_game_controller.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diamonds/application/boosts.dart';
import 'package:transport_minister/features/diamonds/presentation/diamonds_sheet.dart';

typedef DiamondAction = Future<void> Function(int cost, CityCommand command);

class DiamondButton extends StatelessWidget {
  const DiamondButton({
    super.key,
    required this.label,
    required this.cost,
    required this.onPressed,
    this.size = ChunkySize.small,
    this.expanded = false,
  });

  final String label;
  final int cost;
  final VoidCallback? onPressed;
  final ChunkySize size;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return ChunkyButton(
      label: '$label · $cost',
      icon: DiamondStyle.icon,
      palette: DiamondStyle.palette,
      size: size,
      expanded: expanded,
      onPressed: onPressed,
    );
  }
}

Future<void> buyBoost(
  BuildContext context,
  WidgetRef ref,
  CityId city, {
  required int cost,
  required CityCommand command,
  bool revive = false,
}) async {
  final outcome = await ref
      .read(boostsProvider)
      .buy(city, cost: cost, command: command, revive: revive);
  if (outcome == BoostOutcome.notEnoughDiamonds && context.mounted) {
    await showChunkySheet<void>(
      context: context,
      builder: (context) => DiamondsSheet(cityId: city),
    );
  }
}
