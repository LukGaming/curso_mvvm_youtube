import 'package:curso_mvvm_youtube/config/dependencies.dart';
import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/routing/routes.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/widgets/login_screen.dart';
import 'package:curso_mvvm_youtube/ui/home/widgets/home_screen.dart';
import 'package:curso_mvvm_youtube/ui/splash/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter get router {
  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: getIt<AuthRepository>(),
    redirect: _redirect,
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

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final authRepository = getIt<AuthRepository>();
  final isLoggedIn = await authRepository.isAuthenticated;
  if (!isLoggedIn) return Routes.login;
  final isLogginIn =
      state.matchedLocation == Routes.login ||
      state.matchedLocation == Routes.splash;
  if (isLogginIn) return Routes.home;
  print("isLogginIn: $isLogginIn");
  return null;
}
