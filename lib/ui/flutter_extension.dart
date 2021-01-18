import 'package:notifier/ui/all.dart';

extension BuildContextAppLocalizationsExtension on BuildContext {
  AppLocalizations get S {
    return AppLocalizations.of(this);
  }
}
