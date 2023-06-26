import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'domain/use_cases/get_current_theme_mode.dart';
import 'domain/use_cases/toggle_theme_mode.dart';

class AppThemeController extends ChangeNotifier {
  AppThemeController({
    required GetCurrentThemeMode getCurrentThemeMode,
    required this.toggleThemeMode,
  }) {
    final response = getCurrentThemeMode(NoParams());
    _handleResult(response);
  }

  final ToggleThemeMode toggleThemeMode;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void toggle() async {
    final response = await toggleThemeMode(NoParams());
    _handleResult(response, emitFailure: true);
  }

  void _handleResult(
    Either<Failure<dynamic>, ThemeMode> response, {
    bool emitFailure = false,
  }) {
    switch (response) {
      case Left():
        if (!emitFailure) {
          _themeMode = ThemeMode.system;
          notifyListeners();
        }
        break;
      case Right(success: var themeMode!):
        _themeMode = themeMode;
        notifyListeners();
    }
  }
}
