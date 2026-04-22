import 'package:curso_mvvm_youtube/utils/result.dart';

abstract class AuthRepository {
  Future<Result<void>> login({
    required String username,
    required String password,
  });
}
