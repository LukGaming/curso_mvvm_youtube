import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository_remote.dart';
import 'package:curso_mvvm_youtube/data/services/api/api_client.dart';
import 'package:curso_mvvm_youtube/routing/routes.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/widgets/login_screen.dart';
import 'package:curso_mvvm_youtube/ui/home/widgets/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginScreen(
          loginViewmodel: LoginViewmodel(
            authRepository: AuthRepositoryRemote(
              apiClient: ApiClient(apiUrl: "https://dummyjson.com", dio: Dio()),
            ),
          ),
        ),
      ),
      GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    ],
  );
}
