import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/illustrations/bus_illustration.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.cityId});

  final CityId cityId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cityName = cityId.displayName(l10n);
    return Scaffold(
      body: GameBackdrop(
        child: Column(
          children: [
            GameTopBar(
              title: cityName,
              backLabel: l10n.commonBack,
              onBack: () => context.go(AppRoute.cities.path),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BusIllustration(palette: ChunkyPalette.green, width: 180),
                    const SizedBox(height: GameDimens.spaceL),
                    Text(
                      l10n.dashboardWelcome(cityName),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
