import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    Key? key,
    required this.appTheme,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final AppTheme appTheme;

  static AppTheme of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();
    return widget!.appTheme;
  }

  @override
  bool updateShouldNotify(covariant AppThemeProvider oldWidget) {
    return appTheme != oldWidget.appTheme;
  }
}
