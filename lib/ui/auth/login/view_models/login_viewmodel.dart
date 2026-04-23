import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';

class LoginViewmodel {
  final AuthRepository _authRepository;

  const LoginViewmodel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<void>> login((String, String) credentials) async {
    final (username, password) = credentials;
    final result = await _authRepository.login(
      username: username,
      password: password,
    );

    print(result.toString());

    return result;
  }
}
