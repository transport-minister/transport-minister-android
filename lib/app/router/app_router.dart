import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/features/splash/presentation/splash_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoute.splash.path,
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
