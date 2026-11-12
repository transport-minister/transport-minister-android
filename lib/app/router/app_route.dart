enum AppRoute {
  splash('/'),
  cities('/cities'),
  profile('/profile'),
  inbox('/inbox'),
  dashboard('/city/:${AppRoute.cityIdParameter}'),
  technology('/city/:${AppRoute.cityIdParameter}/technology'),
  diplomacy('/city/:${AppRoute.cityIdParameter}/diplomacy');

  const AppRoute(this.path);

  final String path;

  static const cityIdParameter = 'cityId';

  String forCity(String cityId) => path.replaceFirst(':$cityIdParameter', cityId);
}
