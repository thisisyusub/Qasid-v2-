import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';

class GetCurrentThemeMode extends Usecase<Failure, ThemeMode, NoParams> {
  GetCurrentThemeMode(this.themeRepository);

  final ThemeRepository themeRepository;

  @override
  Either<Failure, ThemeMode> call(NoParams params) {
    return themeRepository.getThemeMode();
  }
}
