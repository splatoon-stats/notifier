// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

// ignore: avoid_classes_with_only_static_members
class Config {
  static String _stringField(String key) => env[key] as String;
  static num _numericField(String key) => env[key] as num;
  static bool _boolField(String key) => env[key] as bool ?? false;

  static Map<String, dynamic> env;

  static bool get HIDE_DEBUG_LABEL => _boolField('HIDE_DEBUG_LABEL');

  // Values prefixed with `DEV_` should not be used for release.
  static String get DEV_FIREBASE_DATABASE_URL {
    return _stringField('DEV_FIREBASE_DATABASE_URL');
  }

  static Locale get DEV_LOCALE {
    final String languageCode = _stringField('DEV_LOCALE');
    if (languageCode == null) {
      return null;
    }

    return Locale(languageCode);
  }
}
