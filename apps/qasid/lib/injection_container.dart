import 'package:app_theme_controller/app_theme_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

abstract final class InjectionContainer {
  static Future<void> init() async {
    await ExternalsDI.init();
    await DataSourceDI.init();
    await RepositoryDI.init();
    await UseCaseDI.init();
  }
}

abstract final class ExternalsDI {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    getIt.registerLazySingleton<SharedPreferences>(() {
      return sharedPreferences;
    });
  }
}

abstract final class DataSourceDI {
  static Future<void> init() async {
    getIt.registerLazySingleton<ThemeLocalDataSource>(() {
      return ThemeLocalDataSourceImpl(sharedPreferences: getIt());
    });
  }
}

abstract final class RepositoryDI {
  static Future<void> init() async {
    getIt.registerLazySingleton<ThemeRepository>(() {
      return ThemeRepositoryImpl(localDataSource: getIt());
    });
  }
}

abstract final class UseCaseDI {
  static Future<void> init() async {
    getIt.registerLazySingleton<GetCurrentThemeMode>(() {
      return GetCurrentThemeMode(getIt());
    });

    getIt.registerLazySingleton<ToggleThemeMode>(() {
      return ToggleThemeMode(getIt());
    });
  }
}
