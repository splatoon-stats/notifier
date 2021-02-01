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

  Future<T> push<T>(WidgetBuilder routeBuilder) {
    return Navigator.push<T>(
      this,
      MaterialPageRoute<T>(builder: routeBuilder),
    );
  }
}

extension IntersperseExtension<E> on List<E> {
  List<E> intersperse(E filler) {
    final List<E> result = <E>[];

    for (final E element in this) {
      result..add(element)..add(filler);
    }

    // Instead of taking length into consideration in iteration, just remove
    // last element.
    return result..removeLast();
  }
}

extension SetExtension<E> on Set<E> {
  void toggle(E value) {
    if (contains(value)) {
      remove(value);
    } else {
      add(value);
    }
  }
}

extension IntersperseSpacingExtension<Widget> on List<Widget> {
  List<Widget> intersperseSpacing(EdgeInsetsGeometry padding) {
    return intersperse(Padding(padding: padding) as Widget);
  }
}
