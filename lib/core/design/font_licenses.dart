import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract final class FontLicenses {
  static const _licenses = {
    'Fredoka': 'assets/fonts/fredoka/OFL.txt',
    'Nunito': 'assets/fonts/nunito/OFL.txt',
  };

  static void register() {
    LicenseRegistry.addLicense(() async* {
      for (final entry in _licenses.entries) {
        yield LicenseEntryWithLineBreaks([entry.key], await rootBundle.loadString(entry.value));
      }
    });
  }
}
