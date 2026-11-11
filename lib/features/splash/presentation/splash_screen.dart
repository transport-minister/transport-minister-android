import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.appTitle, style: Theme.of(context).textTheme.headlineMedium),
            Text(l10n.appTagline),
          ],
        ),
      ),
    );
  }
}
