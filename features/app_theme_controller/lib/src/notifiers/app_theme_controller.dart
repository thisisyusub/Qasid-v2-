import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/use_cases/get_current_theme_mode.dart';
import '../domain/use_cases/toggle_theme_mode.dart';

class AppThemeController extends Notifier<ThemeMode> {
  AppThemeController({
    required this.getCurrentThemeMode,
    required this.toggleThemeMode,
  });

  final GetCurrentThemeMode getCurrentThemeMode;
  final ToggleThemeMode toggleThemeMode;

  @override
  ThemeMode build() {
    final response = getCurrentThemeMode(NoParams());

    switch (response) {
      case Left():
        return ThemeMode.system;
      case Right(success: var themeMode!):
        return themeMode;
    }
  }

  void toggle() async {
    final response = await toggleThemeMode(NoParams());

    switch (response) {
      case Right(success: var themeMode!):
        state = themeMode;
        break;
      case Left():
        break;
    }
  }
}
