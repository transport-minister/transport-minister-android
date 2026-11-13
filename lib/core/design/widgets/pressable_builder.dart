import 'dart:async';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_dimens.dart';
import 'package:transport_minister/core/design/widgets/press_feedback.dart';

typedef PressedWidgetBuilder = Widget Function(BuildContext context, bool pressed);

class PressableBuilder extends StatefulWidget {
  const PressableBuilder({
    super.key,
    required this.onPressed,
    required this.builder,
    this.semanticsLabel,
    this.pressedScale = 0.94,
  });

  final VoidCallback? onPressed;
  final PressedWidgetBuilder builder;
  final String? semanticsLabel;
  final double pressedScale;

  @override
  State<PressableBuilder> createState() => _PressableBuilderState();
}

class _PressableBuilderState extends State<PressableBuilder> {
  var _pressed = false;
  var _down = false;
  Timer? _hold;

  bool get _enabled => widget.onPressed != null;

  @override
  void dispose() {
    _hold?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: _enabled,
      label: widget.semanticsLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _enabled ? _handleTapDown : null,
        onTapUp: _enabled ? _handleTapUp : null,
        onTapCancel: _enabled ? _handleTapCancel : null,
        onTap: _enabled ? _handleTap : null,
        child: AnimatedScale(
          scale: _pressed ? widget.pressedScale : 1,
          duration: _pressed ? GameDimens.pressDuration : GameDimens.releaseDuration,
          curve: _pressed ? Curves.easeOut : Curves.easeOutBack,
          child: widget.builder(context, _pressed),
        ),
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    _down = true;
    _hold?.cancel();
    _hold = Timer(GameDimens.pressHold, () {
      _hold = null;
      if (!_down) {
        _updatePressed(false);
      }
    });
    _updatePressed(true);
  }

  void _handleTapUp(TapUpDetails details) {
    _down = false;
    if (_hold == null) {
      _updatePressed(false);
    }
  }

  void _handleTapCancel() {
    _down = false;
    _hold?.cancel();
    _hold = null;
    _updatePressed(false);
  }

  void _updatePressed(bool pressed) {
    if (mounted && _pressed != pressed) {
      setState(() => _pressed = pressed);
    }
  }

  void _handleTap() {
    HapticFeedback.lightImpact();
    PressFeedback.maybeOf(context)?.call();
    widget.onPressed?.call();
  }
}
