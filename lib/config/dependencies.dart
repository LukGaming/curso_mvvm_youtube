import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository_remote.dart';
import 'package:curso_mvvm_youtube/data/services/api/api_client.dart';
import 'package:curso_mvvm_youtube/data/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependecies() {
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );

  getIt.registerSingleton<ApiClient>(
    ApiClient(apiUrl: "https://dummyjson.com", dio: Dio()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryRemote(
      apiClient: getIt(),
      sharedPreferencesService: getIt(),
    ),
  );
}
