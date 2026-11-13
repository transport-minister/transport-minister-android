import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/features/settings/application/settings_controller.dart';
import 'package:transport_minister/features/settings/domain/app_language.dart';
import 'package:transport_minister/features/settings/presentation/language_flag.dart';
import 'package:transport_minister/features/sound/presentation/sound_settings_card.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension AppLanguageText on AppLanguage {
  String get nativeName => switch (this) {
    AppLanguage.english => 'English',
    AppLanguage.turkish => 'Türkçe',
    AppLanguage.russian => 'Русский',
  };
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final chosen =
        ref.watch(languageProvider).value ??
        AppLanguage.fromCode(Localizations.localeOf(context).languageCode);
    final version = ref.watch(appVersionProvider).value;
    return Scaffold(
      body: GameBackdrop(
        child: Column(
          children: [
            GameTopBar(
              title: l10n.settingsTitle,
              backLabel: l10n.commonBack,
              onBack: () => context.pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  GameDimens.spaceL,
                  GameDimens.spaceS,
                  GameDimens.spaceL,
                  GameDimens.spaceXXL,
                ),
                children: [
                  Text(l10n.settingsLanguage, style: textTheme.titleLarge),
                  const SizedBox(height: GameDimens.spaceM),
                  for (final language in AppLanguage.values) ...[
                    _LanguageCard(
                      language: language,
                      selected: language == chosen,
                      onPressed: () => ref.read(languageProvider.notifier).choose(language),
                    ),
                    const SizedBox(height: GameDimens.spaceM),
                  ],
                  const SizedBox(height: GameDimens.spaceL),
                  Text(l10n.settingsSound, style: textTheme.titleLarge),
                  const SizedBox(height: GameDimens.spaceM),
                  const SoundSettingsCard(),
                  const SizedBox(height: GameDimens.spaceXL),
                  Text(l10n.settingsAbout, style: textTheme.titleLarge),
                  const SizedBox(height: GameDimens.spaceM),
                  ChunkyCard(
                    depth: 3,
                    padding: const EdgeInsets.all(GameDimens.spaceM),
                    child: Row(
                      children: [
                        const IconBubble(
                          icon: Icons.directions_bus_rounded,
                          palette: ChunkyPalette.sunny,
                          size: 46,
                        ),
                        const SizedBox(width: GameDimens.spaceM),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.appTitle, style: textTheme.titleMedium),
                              if (version != null)
                                Text(l10n.settingsVersion(version), style: textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({required this.language, required this.selected, required this.onPressed});

  final AppLanguage language;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: language.nativeName,
      pressedScale: 0.97,
      builder: (context, pressed) => ChunkyCard(
        depth: 3,
        color: selected ? ChunkyPalette.lagoon.glow.withValues(alpha: 0.45) : GameColors.paper,
        padding: const EdgeInsets.all(GameDimens.spaceM),
        child: Row(
          children: [
            LanguageFlag(language: language),
            const SizedBox(width: GameDimens.spaceM),
            Expanded(
              child: Text(language.nativeName, style: Theme.of(context).textTheme.titleMedium),
            ),
            Icon(
              selected ? Icons.check_circle_rounded : Icons.circle_outlined,
              color: selected ? ChunkyPalette.lagoon.deep : GameColors.inkFaint,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
