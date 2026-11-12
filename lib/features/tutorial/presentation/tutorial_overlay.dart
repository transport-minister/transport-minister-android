import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/tutorial/application/tutorial_controller.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class TutorialTargets {
  final budget = GlobalKey(debugLabel: 'budget');
  final mood = GlobalKey(debugLabel: 'mood');
  final rank = GlobalKey(debugLabel: 'rank');
  final map = GlobalKey(debugLabel: 'map');
  final level = GlobalKey(debugLabel: 'level');
  final news = GlobalKey(debugLabel: 'news');
  final tasks = GlobalKey(debugLabel: 'tasks');
  final diplomacy = GlobalKey(debugLabel: 'diplomacy');

  GlobalKey? of(TutorialStep step) => switch (step) {
    TutorialStep.budget => budget,
    TutorialStep.mood => mood,
    TutorialStep.district => map,
    TutorialStep.level => level,
    TutorialStep.news => news,
    TutorialStep.tasks => tasks,
    TutorialStep.diplomacy => diplomacy,
    TutorialStep.profile => rank,
    TutorialStep.welcome || TutorialStep.buyBus || TutorialStep.busBought => null,
  };
}

class TutorialOverlay extends ConsumerStatefulWidget {
  const TutorialOverlay({
    super.key,
    required this.cityId,
    required this.targets,
    required this.districtName,
  });

  final CityId cityId;
  final TutorialTargets targets;
  final String districtName;

  @override
  ConsumerState<TutorialOverlay> createState() => _TutorialOverlayState();
}

class _TutorialOverlayState extends ConsumerState<TutorialOverlay> {
  static final _shade = GameColors.ink.withValues(alpha: 0.55);

  Rect? _holeFor(TutorialStep step) {
    final box = widget.targets.of(step)?.currentContext?.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) {
      return null;
    }
    return box.localToGlobal(Offset.zero) & box.size;
  }

  @override
  Widget build(BuildContext context) {
    final step = ref.watch(tutorialProvider);
    if (step == null || step == TutorialStep.buyBus) {
      return const SizedBox.shrink();
    }
    final hole = _holeFor(step)?.inflate(6);
    if (widget.targets.of(step) != null && hole == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
    final screen = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    final cardOnTop = hole != null && hole.center.dy > screen.height / 2;
    return Stack(
      children: [
        ..._shadeAround(hole, screen, passThrough: step.waitsForAction),
        if (hole != null)
          Positioned.fromRect(
            rect: hole,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(GameDimens.radiusM),
                  border: Border.all(color: ChunkyPalette.sunny.face, width: 4),
                ),
              ),
            ),
          ),
        Positioned(
          left: GameDimens.spaceL,
          right: GameDimens.spaceL,
          top: cardOnTop ? padding.top + GameDimens.spaceM : null,
          bottom: cardOnTop ? null : padding.bottom + GameDimens.spaceL,
          child: _TutorialCard(
            step: step,
            message: _message(AppLocalizations.of(context), step),
            onNext: () => step == TutorialStep.profile
                ? ref.read(tutorialProvider.notifier).finish(widget.cityId)
                : ref.read(tutorialProvider.notifier).next(),
            onSkip: () => ref.read(tutorialProvider.notifier).skip(),
          ),
        ),
      ],
    );
  }

  List<Widget> _shadeAround(Rect? hole, Size screen, {required bool passThrough}) {
    Widget block(Rect rect) => Positioned.fromRect(
      rect: rect,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: ColoredBox(color: _shade),
      ),
    );
    if (hole == null) {
      return [block(Offset.zero & screen)];
    }
    return [
      block(Rect.fromLTRB(0, 0, screen.width, hole.top)),
      block(Rect.fromLTRB(0, hole.bottom, screen.width, screen.height)),
      block(Rect.fromLTRB(0, hole.top, hole.left, hole.bottom)),
      block(Rect.fromLTRB(hole.right, hole.top, screen.width, hole.bottom)),
      if (!passThrough)
        Positioned.fromRect(
          rect: hole,
          child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () {}),
        ),
    ];
  }

  String _message(AppLocalizations l10n, TutorialStep step) => switch (step) {
    TutorialStep.welcome => l10n.tutorialWelcome,
    TutorialStep.budget => l10n.tutorialBudget,
    TutorialStep.mood => l10n.tutorialMood,
    TutorialStep.district => l10n.tutorialDistrict(widget.districtName),
    TutorialStep.buyBus => l10n.tutorialBuyBus(MoneyFormat.compact(TutorialController.welcomeGift)),
    TutorialStep.busBought => l10n.tutorialBusBought,
    TutorialStep.level => l10n.tutorialLevel,
    TutorialStep.news => l10n.tutorialNews,
    TutorialStep.tasks => l10n.tutorialTasks,
    TutorialStep.diplomacy => l10n.tutorialDiplomacy,
    TutorialStep.profile => l10n.tutorialProfile,
  };
}

class _TutorialCard extends StatelessWidget {
  const _TutorialCard({
    required this.step,
    required this.message,
    required this.onNext,
    required this.onSkip,
  });

  final TutorialStep step;
  final String message;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ChunkyCard(
      color: GameColors.cream,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MrBusSays(
            title: step == TutorialStep.welcome ? l10n.tutorialWelcomeTitle : null,
            message: message,
            mood: switch (step) {
              TutorialStep.welcome || TutorialStep.busBought => MrBusMood.excited,
              TutorialStep.mood => MrBusMood.worried,
              TutorialStep.district => MrBusMood.thinking,
              _ => MrBusMood.happy,
            },
            mascotSize: 72,
          ),
          const SizedBox(height: GameDimens.spaceM),
          Row(
            children: [
              PressableBuilder(
                onPressed: onSkip,
                semanticsLabel: l10n.tutorialSkip,
                builder: (context, pressed) => Padding(
                  padding: const EdgeInsets.all(GameDimens.spaceS),
                  child: Text(
                    l10n.tutorialSkip,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: GameColors.inkSoft,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              if (!step.waitsForAction)
                ChunkyButton(
                  label: step == TutorialStep.profile ? l10n.tutorialFinish : l10n.tutorialNext,
                  icon: Icons.arrow_forward_rounded,
                  size: ChunkySize.small,
                  onPressed: onNext,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
