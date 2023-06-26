import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract interface class ThemeRepository {
  Either<Failure, ThemeMode> getThemeMode();
  Future<Either<Failure, ThemeMode>> toggle();
}
