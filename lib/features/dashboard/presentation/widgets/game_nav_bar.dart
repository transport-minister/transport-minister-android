import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';

class GameNavItem {
  const GameNavItem({
    required this.icon,
    required this.label,
    required this.palette,
    required this.onPressed,
    this.badge,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final ChunkyPalette palette;
  final VoidCallback onPressed;
  final String? badge;
  final bool selected;
}

class GameNavBar extends StatelessWidget {
  const GameNavBar({super.key, required this.items});

  final List<GameNavItem> items;

  static const height = 74.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: GameColors.paper,
        border: Border(
          top: BorderSide(color: GameColors.ink, width: GameDimens.outline),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: height,
          child: Row(
            children: [for (final item in items) Expanded(child: _NavButton(item: item))],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item});

  final GameNavItem item;

  @override
  Widget build(BuildContext context) {
    final badge = item.badge;
    return PressableBuilder(
      onPressed: item.onPressed,
      semanticsLabel: item.label,
      pressedScale: 0.9,
      builder: (context, pressed) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconBubble(
                icon: item.icon,
                palette: item.selected ? item.palette : ChunkyPalette.snow,
                size: 40,
              ),
              if (badge != null)
                Positioned(
                  top: -6,
                  right: -8,
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 20),
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ChunkyPalette.coral.face,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: GameColors.paper,
                        height: 1,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: item.selected ? GameColors.ink : GameColors.inkSoft,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
