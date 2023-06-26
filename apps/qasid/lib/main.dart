import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppThemeProvider(
      appTheme: AppTheme(
        colors: AppColorsData.light(),
        typography: AppTypographyData.regular(),
      ),
      child: const MaterialApp(
        title: 'Qasid (v2)',
        home: Scaffold(),
      ),
    );
  }
}
