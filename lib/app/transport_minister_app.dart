import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_router.dart';
import 'package:transport_minister/core/design/game_theme.dart';
import 'package:transport_minister/features/settings/application/settings_controller.dart';
import 'package:transport_minister/features/sound/presentation/sound_scope.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class TransportMinisterApp extends ConsumerWidget {
  const TransportMinisterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider).value;
    return SoundScope(
      child: MaterialApp.router(
        locale: language == null ? null : Locale(language.code),
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        debugShowCheckedModeBanner: false,
        theme: GameTheme.light(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: ref.watch(appRouterProvider),
      ),
    );
  }
}
