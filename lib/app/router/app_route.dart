enum AppRoute {
  splash('/'),
  cities('/cities'),
  profile('/profile'),
  dashboard('/city/:${AppRoute.cityIdParameter}');

  const AppRoute(this.path);

  final String path;

  static const cityIdParameter = 'cityId';
}
