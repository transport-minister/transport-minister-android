import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_selection_providers.dart';
import 'package:transport_minister/features/city_selection/presentation/city_selection_screen.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';
import 'package:transport_minister/features/diplomacy/presentation/diplomacy_screen.dart';
import 'package:transport_minister/features/inbox/presentation/inbox_screen.dart';
import 'package:transport_minister/features/oath/presentation/oath_screen.dart';
import 'package:transport_minister/features/progression/presentation/profile_screen.dart';
import 'package:transport_minister/features/settings/presentation/settings_screen.dart';
import 'package:transport_minister/features/shop/presentation/shop_screen.dart';
import 'package:transport_minister/features/splash/presentation/splash_screen.dart';
import 'package:transport_minister/features/technology/presentation/technology_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  CityId? playableCityFrom(GoRouterState state) {
    final cityId = CityId.values.asNameMap()[state.pathParameters[AppRoute.cityIdParameter]];
    final playable = ref.read(citiesProvider).any((city) => city.id == cityId && city.isPlayable);
    return playable ? cityId : null;
  }

  final router = GoRouter(
    initialLocation: AppRoute.splash.path,
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoute.oath.path,
        name: AppRoute.oath.name,
        builder: (context, state) => const OathScreen(),
      ),
      GoRoute(
        path: AppRoute.cities.path,
        name: AppRoute.cities.name,
        builder: (context, state) => const CitySelectionScreen(),
      ),
      GoRoute(
        path: AppRoute.profile.path,
        name: AppRoute.profile.name,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoute.inbox.path,
        name: AppRoute.inbox.name,
        builder: (context, state) => const InboxScreen(),
      ),
      GoRoute(
        path: AppRoute.settings.path,
        name: AppRoute.settings.name,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoute.dashboard.path,
        name: AppRoute.dashboard.name,
        redirect: (context, state) => playableCityFrom(state) == null ? AppRoute.cities.path : null,
        builder: (context, state) => DashboardScreen(cityId: playableCityFrom(state)!),
      ),
      GoRoute(
        path: AppRoute.technology.path,
        name: AppRoute.technology.name,
        redirect: (context, state) => playableCityFrom(state) == null ? AppRoute.cities.path : null,
        builder: (context, state) => TechnologyScreen(cityId: playableCityFrom(state)!),
      ),
      GoRoute(
        path: AppRoute.diplomacy.path,
        name: AppRoute.diplomacy.name,
        redirect: (context, state) => playableCityFrom(state) == null ? AppRoute.cities.path : null,
        builder: (context, state) => DiplomacyScreen(cityId: playableCityFrom(state)!),
      ),
      GoRoute(
        path: AppRoute.shop.path,
        name: AppRoute.shop.name,
        redirect: (context, state) => playableCityFrom(state) == null ? AppRoute.cities.path : null,
        builder: (context, state) => ShopScreen(cityId: playableCityFrom(state)!),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
