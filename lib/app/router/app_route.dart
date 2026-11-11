enum AppRoute {
  splash('/'),
  cities('/cities'),
  profile('/profile'),
  inbox('/inbox'),
  dashboard('/city/:${AppRoute.cityIdParameter}');

  const AppRoute(this.path);

  final String path;

  static const cityIdParameter = 'cityId';
}
