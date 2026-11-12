import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/features/city_game/application/city_game_controller.dart';

typedef DistrictAction = Future<void> Function(CityCommand command, String success);

const panelBottomSpace = 84.0;

class PanelSectionTitle extends StatelessWidget {
  const PanelSectionTitle({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final trailing = this.trailing;
    return Padding(
      padding: const EdgeInsets.only(bottom: GameDimens.spaceS),
      child: Row(
        children: [
          Expanded(child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
          ?trailing,
        ],
      ),
    );
  }
}

class ProblemText extends StatelessWidget {
  const ProblemText(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: GameDimens.spaceXS),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: ChunkyPalette.coral.deep,
        ),
      ),
    );
  }
}
