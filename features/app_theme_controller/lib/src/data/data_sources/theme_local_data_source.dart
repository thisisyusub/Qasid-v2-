import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _isDarkEnabled = 'isDarkEnabled';

abstract interface class ThemeLocalDataSource {
  ThemeMode getThemeMode();
  Future<ThemeMode> toggle();
}

final class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  const ThemeLocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  ThemeMode getThemeMode() {
    final themeMode = sharedPreferences.getBool(_isDarkEnabled);

    return switch (themeMode) {
      true => ThemeMode.light,
      false => ThemeMode.dark,
      _ => ThemeMode.system
    };
  }

  @override
  Future<ThemeMode> toggle() async {
    final isDarkMode = sharedPreferences.getBool(_isDarkEnabled) ?? false;
    await sharedPreferences.setBool(_isDarkEnabled, !isDarkMode);
    return getThemeMode();
  }
}
