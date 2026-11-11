import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

typedef PressedWidgetBuilder = Widget Function(BuildContext context, bool pressed);

class PressableBuilder extends StatefulWidget {
  const PressableBuilder({
    super.key,
    required this.onPressed,
    required this.builder,
    this.semanticsLabel,
  });

  final VoidCallback? onPressed;
  final PressedWidgetBuilder builder;
  final String? semanticsLabel;

  @override
  State<PressableBuilder> createState() => _PressableBuilderState();
}

class _PressableBuilderState extends State<PressableBuilder> {
  var _pressed = false;

  bool get _enabled => widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: _enabled,
      label: widget.semanticsLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _enabled ? (_) => _updatePressed(true) : null,
        onTapUp: _enabled ? (_) => _updatePressed(false) : null,
        onTapCancel: _enabled ? () => _updatePressed(false) : null,
        onTap: _enabled ? _handleTap : null,
        child: widget.builder(context, _pressed),
      ),
    );
  }

  void _updatePressed(bool pressed) {
    if (_pressed != pressed) {
      setState(() => _pressed = pressed);
    }
  }

  void _handleTap() {
    HapticFeedback.lightImpact();
    widget.onPressed?.call();
  }
}
