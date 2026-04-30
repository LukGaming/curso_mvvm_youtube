import 'package:curso_mvvm_youtube/config/dependencies.dart';
import 'package:curso_mvvm_youtube/routing/routes.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/widgets/login_screen.dart';
import 'package:curso_mvvm_youtube/ui/home/widgets/home_screen.dart';
import 'package:curso_mvvm_youtube/ui/splash/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter get router {
  return GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginScreen(
          loginViewmodel: LoginViewmodel(authRepository: getIt()),
        ),
      ),
      GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
      GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    ],
  );
}
