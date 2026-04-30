import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/data/services/api/api_client.dart';
import 'package:curso_mvvm_youtube/data/services/api/models/login_request.dart';
import 'package:curso_mvvm_youtube/data/services/shared_preferences_service.dart';
import 'package:curso_mvvm_youtube/domain/models/user.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryRemote extends ChangeNotifier implements AuthRepository {
  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;

  AuthRepositoryRemote({
    required ApiClient apiClient,
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService,
       _apiClient = apiClient;

  @override
  Future<Result<void>> login({
    required String username,
    required String password,
  }) async {
    try {
      final LoginRequest loginRequest = LoginRequest(
        username: username,
        password: password,
        expiresInMins: 30,
      );

      final result = await _apiClient.login(loginRequest);

      switch (result) {
        case Ok():
          final user = User(
            accessToken: result.value.accessToken,
            refreshToken: result.value.refreshToken,
            id: result.value.id,
            username: result.value.username,
            email: result.value.email,
            firstName: result.value.firstName,
            lastName: result.value.lastName,
            gender: result.value.gender,
            image: result.value.image,
          );

          await _sharedPreferencesService.saveUser(user);
          break;
        default:
      }

      return result;
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    final result = await _sharedPreferencesService.fetchUser();
    switch (result) {
      case Ok<User?>():
        return result.value != null;
      default:
        return false;
    }
  }
}
