enum AppLanguage {
  english('en'),
  turkish('tr'),
  russian('ru');

  const AppLanguage(this.code);

  final String code;

  static AppLanguage? fromCode(String? code) =>
      values.where((language) => language.code == code).firstOrNull;
}
