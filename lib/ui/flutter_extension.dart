import 'package:notifier/ui/all.dart';

extension BuildContextAppLocalizationsExtension on BuildContext {
  AppLocalizations get S {
    return AppLocalizations.of(this);
  }

  ThemeData get theme {
    return Theme.of(this);
  }

  TextTheme get textTheme {
    return theme.textTheme;
  }
}
