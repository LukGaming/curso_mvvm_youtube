import 'package:curso_mvvm_youtube/utils/result.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;

  Future<Result<void>> login({
    required String username,
    required String password,
  });
}
