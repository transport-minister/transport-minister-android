import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/widgets/press_feedback.dart';
import 'package:transport_minister/features/sound/application/game_audio.dart';
import 'package:transport_minister/features/sound/application/sound_providers.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';

class SoundScope extends ConsumerStatefulWidget {
  const SoundScope({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<SoundScope> createState() => _SoundScopeState();
}

class _SoundScopeState extends ConsumerState<SoundScope> {
  late final GameAudio _audio;
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _audio = ref.read(gameAudioProvider);
    _lifecycle = AppLifecycleListener(onHide: _audio.toBackground, onShow: _audio.toForeground);
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PressFeedback(onPress: () => _audio.play(GameSound.tap), child: widget.child);
  }
}
