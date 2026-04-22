import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/data/services/api/api_client.dart';
import 'package:curso_mvvm_youtube/data/services/api/models/login_request.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';

class AuthRepositoryRemote implements AuthRepository {
  final ApiClient _apiClient;

  const AuthRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Result<void>> login({
    required String username,
    required String password,
  }) async {
    final LoginRequest loginRequest = LoginRequest(
      username: username,
      password: password,
      expiresInMins: 30,
    );

    return await _apiClient.login(loginRequest);
  }
}
