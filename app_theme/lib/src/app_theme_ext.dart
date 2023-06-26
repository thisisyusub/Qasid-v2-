import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'app_colors.dart';
import 'app_theme.dart';
import 'app_typography.dart';

extension AppThemeExt on BuildContext {
  AppTheme get theme => AppThemeProvider.of(this);
  AppTypographyData get typography => theme.typography;
  AppColorsData get colors => theme.colors;
}
