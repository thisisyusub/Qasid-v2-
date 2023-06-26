import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';

class ToggleThemeMode extends AsyncUsecase<Failure, ThemeMode, NoParams> {
  ToggleThemeMode(this.themeRepository);

  final ThemeRepository themeRepository;

  @override
  Future<Either<Failure, ThemeMode>> call(NoParams params) {
    return themeRepository.toggle();
  }
}
