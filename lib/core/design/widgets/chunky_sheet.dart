import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';

Future<T?> showChunkySheet<T>({required BuildContext context, required WidgetBuilder builder}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: GameColors.ink.withValues(alpha: 0.45),
    builder: (context) => ChunkySheetFrame(child: builder(context)),
  );
}

class ChunkySheetFrame extends StatelessWidget {
  const ChunkySheetFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: GameColors.cream,
        borderRadius: BorderRadius.vertical(top: Radius.circular(GameDimens.radiusXL)),
        border: Border(
          top: BorderSide(color: GameColors.ink, width: GameDimens.outline),
          left: BorderSide(color: GameColors.ink, width: GameDimens.outline),
          right: BorderSide(color: GameColors.ink, width: GameDimens.outline),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            GameDimens.spaceXL,
            GameDimens.spaceM,
            GameDimens.spaceXL,
            GameDimens.spaceXL,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 48,
                  height: 6,
                  decoration: BoxDecoration(
                    color: GameColors.inkFaint,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: GameDimens.spaceL),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
