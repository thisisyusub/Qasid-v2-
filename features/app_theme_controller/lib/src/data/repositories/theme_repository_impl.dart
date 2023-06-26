import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/theme_repository.dart';
import '../data_sources/theme_local_data_source.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl({required this.localDataSource});

  final ThemeLocalDataSource localDataSource;

  @override
  Either<Failure, ThemeMode> getThemeMode() {
    {
      try {
        final themeMode = localDataSource.getThemeMode();
        return Right(themeMode);
      } on Exception {
        return Left(const Failure.cache());
      }
    }
  }

  @override
  Future<Either<Failure, ThemeMode>> toggle() async {
    try {
      final themeMode = await localDataSource.toggle();
      return Right(themeMode);
    } on Exception {
      return Left(const Failure.cache());
    }
  }
}
