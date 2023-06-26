import 'package:app_theme/app_theme.dart';
import 'package:app_theme_controller/app_theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../theme_test_page.dart';

final appThemeProvider = NotifierProvider<AppThemeController, ThemeMode>(
  () => AppThemeController(
    getCurrentThemeMode: GetIt.instance(),
    toggleThemeMode: GetIt.instance(),
  ),
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);

    return AppThemeProvider(
      appTheme: AppTheme(
        colors: switch (themeMode) {
          ThemeMode.light => AppColorsData.light(),
          ThemeMode.dark => AppColorsData.dark(),
          ThemeMode.system => AppColorsData.light(),
        },
        typography: AppTypographyData.regular(),
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Qasid (v2)',
            themeMode: themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorSchemeSeed: context.colors.background,
              cardColor: Colors.green,
              switchTheme: SwitchThemeData(
                trackColor: MaterialStateProperty.all(Colors.green),
              ),
              cupertinoOverrideTheme: const CupertinoThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.green,
                applyThemeToAll: true,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorSchemeSeed: context.colors.background,
              cardColor: Colors.red,
              switchTheme: SwitchThemeData(
                trackColor: MaterialStateProperty.all(Colors.red),
              ),
              cupertinoOverrideTheme: const CupertinoThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.red,
                applyThemeToAll: true,
              ),
            ),
            home: const ThemeTestPage(),
          );
        },
      ),
    );
  }
}
