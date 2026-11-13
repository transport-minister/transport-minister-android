import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/features/sound/application/sound_providers.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';
import 'package:transport_minister/features/sound/domain/sound_settings.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension SoundGroupPresentation on SoundGroup {
  String label(AppLocalizations l10n) => switch (this) {
    SoundGroup.music => l10n.soundMusic,
    SoundGroup.effects => l10n.soundEffects,
    SoundGroup.city => l10n.soundCity,
  };

  IconData get icon => switch (this) {
    SoundGroup.music => Icons.music_note_rounded,
    SoundGroup.effects => Icons.touch_app_rounded,
    SoundGroup.city => Icons.location_city_rounded,
  };

  ChunkyPalette get palette => switch (this) {
    SoundGroup.music => ChunkyPalette.grape,
    SoundGroup.effects => ChunkyPalette.green,
    SoundGroup.city => ChunkyPalette.lagoon,
  };
}

class SoundSettingsCard extends ConsumerWidget {
  const SoundSettingsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(soundSettingsProvider).value ?? const SoundSettings();
    return ChunkyCard(
      depth: 3,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        children: [
          for (final group in SoundGroup.values) ...[
            if (group.index > 0) const SizedBox(height: GameDimens.spaceM),
            _SoundRow(group: group, level: settings.of(group)),
          ],
        ],
      ),
    );
  }
}

class _SoundRow extends ConsumerWidget {
  const _SoundRow({required this.group, required this.level});

  final SoundGroup group;
  final SoundLevel level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final label = group.label(AppLocalizations.of(context));
    final controller = ref.read(soundSettingsProvider.notifier);
    return Column(
      children: [
        Row(
          children: [
            IconBubble(icon: group.icon, palette: group.palette, size: 40),
            const SizedBox(width: GameDimens.spaceM),
            Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
            Switch(
              value: level.enabled,
              activeTrackColor: ChunkyPalette.green.face,
              onChanged: (enabled) => controller.change(group, level.copyWith(enabled: enabled)),
            ),
          ],
        ),
        Semantics(
          label: label,
          child: Slider(
            value: level.volume,
            activeColor: group.palette.face,
            inactiveColor: group.palette.glow,
            semanticFormatterCallback: (volume) => '${(volume * 100).round()}%',
            onChanged: level.enabled
                ? (volume) => controller.preview(group, level.copyWith(volume: volume))
                : null,
            onChangeEnd: (volume) => controller.change(group, level.copyWith(volume: volume)),
          ),
        ),
      ],
    );
  }
}
