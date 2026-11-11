import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_dimens.dart';
import 'package:transport_minister/core/design/widgets/chunky_icon_button.dart';

class GameTopBar extends StatelessWidget {
  const GameTopBar({
    super.key,
    required this.title,
    this.onBack,
    this.backLabel = 'Back',
    this.trailing = const [],
  });

  final String title;
  final VoidCallback? onBack;
  final String backLabel;
  final List<Widget> trailing;

  @override
  Widget build(BuildContext context) {
    final back = onBack;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          GameDimens.spaceL,
          GameDimens.spaceS,
          GameDimens.spaceL,
          GameDimens.spaceS,
        ),
        child: Row(
          children: [
            if (back != null) ...[
              ChunkyIconButton(
                icon: Icons.arrow_back_rounded,
                onPressed: back,
                semanticsLabel: backLabel,
              ),
              const SizedBox(width: GameDimens.spaceM),
            ],
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            for (final widget in trailing) ...[const SizedBox(width: GameDimens.spaceS), widget],
          ],
        ),
      ),
    );
  }
}
