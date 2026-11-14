import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/widgets/sticker_text.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';
import 'package:transport_minister/features/diamonds/presentation/diamonds_sheet.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class OathScreen extends ConsumerStatefulWidget {
  const OathScreen({super.key});

  @override
  ConsumerState<OathScreen> createState() => _OathScreenState();
}

class _OathScreenState extends ConsumerState<OathScreen> with SingleTickerProviderStateMixin {
  static const _ceremony = Duration(milliseconds: 2400);

  late final _controller = AnimationController(vsync: this, duration: _ceremony);
  late final _signature = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.4, curve: Curves.easeInOut),
  );
  late final _stamp = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.45, 0.7, curve: Curves.elasticOut),
  );
  late final _gift = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.75, 1, curve: Curves.easeOutBack),
  );
  var _signed = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sign() async {
    if (_signed) {
      return;
    }
    setState(() => _signed = true);
    await ref.read(profileProvider.notifier).takeOath();
    if (mounted) {
      await _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: GameBackdrop(
        style: BackdropStyle.sky,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: GameDimens.spaceXL),
                child: Column(
                  children: [
                    const Spacer(),
                    Transform.rotate(
                      angle: -0.03,
                      child: ChunkyCard(
                        padding: const EdgeInsets.all(GameDimens.spaceXL),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Center(
                              child: IconBubble(
                                icon: Icons.account_balance_rounded,
                                palette: ChunkyPalette.grape,
                                size: 56,
                              ),
                            ),
                            const SizedBox(height: GameDimens.spaceM),
                            Text(
                              l10n.oathTitle,
                              textAlign: TextAlign.center,
                              style: textTheme.headlineSmall,
                            ),
                            const SizedBox(height: GameDimens.spaceM),
                            Text(
                              l10n.oathBody,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium,
                            ),
                            const SizedBox(height: GameDimens.spaceXL),
                            SizedBox(
                              height: 72,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned.fill(
                                    child: CustomPaint(painter: _SignaturePainter(_signature)),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: -24,
                                    child: ScaleTransition(
                                      scale: _stamp,
                                      child: Transform.rotate(
                                        angle: -0.25,
                                        child: _Stamp(label: l10n.oathStamp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(height: 2.5, color: GameColors.ink),
                            const SizedBox(height: GameDimens.spaceXS),
                            Text(l10n.oathSignatureLine, style: textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: GameDimens.spaceL),
                    SizedBox(
                      height: 112,
                      child: ScaleTransition(
                        scale: _gift,
                        child: Column(
                          children: [
                            StickerText(
                              l10n.oathWelcome,
                              fontSize: 22,
                              color: ChunkyPalette.sunny.face,
                            ),
                            const SizedBox(height: GameDimens.spaceS),
                            GameTag(
                              label: l10n.oathGift(DiamondRules.welcomeGift),
                              palette: DiamondStyle.palette,
                              icon: DiamondStyle.icon,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        MrBus(mood: _signed ? MrBusMood.excited : MrBusMood.happy, size: 84),
                        const SizedBox(width: GameDimens.spaceM),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _gift,
                            builder: (context, _) => ChunkyButton(
                              label: _gift.value > 0.5 ? l10n.oathTakeOffice : l10n.oathSign,
                              icon: _gift.value > 0.5 ? Icons.flag_rounded : Icons.draw_rounded,
                              palette: _gift.value > 0.5
                                  ? ChunkyPalette.green
                                  : ChunkyPalette.sunny,
                              size: ChunkySize.large,
                              expanded: true,
                              onPressed: _signed
                                  ? (_gift.value > 0.5
                                        ? () => context.go(AppRoute.cities.path)
                                        : null)
                                  : _sign,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: GameDimens.spaceXL),
                  ],
                ),
              ),
            ),
            if (_signed) const Positioned.fill(child: ConfettiBurst()),
          ],
        ),
      ),
    );
  }
}

class _Stamp extends StatelessWidget {
  const _Stamp({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ChunkyPalette.coral.deep, width: 4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: ChunkyPalette.coral.deep,
          height: 1,
        ),
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  _SignaturePainter(this.progress) : super(repaint: progress);

  final Animation<double> progress;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress.value == 0) {
      return;
    }
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w * 0.05, h * 0.75)
      ..cubicTo(w * 0.1, h * 0.1, w * 0.2, h * 0.1, w * 0.18, h * 0.6)
      ..cubicTo(w * 0.17, h * 0.95, w * 0.3, h * 0.9, w * 0.33, h * 0.5)
      ..cubicTo(w * 0.36, h * 0.15, w * 0.42, h * 0.3, w * 0.45, h * 0.7)
      ..cubicTo(w * 0.5, h * 1.1, w * 0.55, h * 0.3, w * 0.62, h * 0.55)
      ..cubicTo(w * 0.7, h * 0.85, w * 0.8, h * 0.2, w * 0.9, h * 0.6);
    final metric = path.computeMetrics().first;
    final drawn = metric.extractPath(0, metric.length * progress.value);
    canvas.drawPath(
      drawn,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.round
        ..color = const Color(0xFF2B3A67),
    );
    final tip = metric.getTangentForOffset(metric.length * progress.value)?.position;
    if (tip != null && progress.value < 1) {
      canvas
        ..save()
        ..translate(tip.dx, tip.dy)
        ..rotate(-math.pi / 4)
        ..drawRRect(
          RRect.fromRectAndRadius(const Rect.fromLTWH(-3, -34, 6, 34), const Radius.circular(3)),
          Paint()..color = ChunkyPalette.sunny.face,
        )
        ..drawRRect(
          RRect.fromRectAndRadius(const Rect.fromLTWH(-3, -34, 6, 34), const Radius.circular(3)),
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5
            ..color = GameColors.ink,
        )
        ..restore();
    }
  }

  @override
  bool shouldRepaint(_SignaturePainter oldDelegate) => false;
}
