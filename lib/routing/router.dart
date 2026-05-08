import 'package:curso_mvvm_youtube/config/dependencies.dart';
import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:curso_mvvm_youtube/routing/routes.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/widgets/login_screen.dart';
import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/cart/widgets/cart_screen.dart';
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
      GoRoute(
        path: Routes.home,
        builder: (context, state) => HomeScreen(cartViewModel: CartViewmodel()),
      ),
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => SplashScreen(authRepository: getIt()),
      ),
      GoRoute(path: Routes.cart, builder: (context, state) => CartScreen()),
    ],
  );
}

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = await getIt<AuthRepository>().isAuthenticated;
  print("IsLoggedIn: $loggedIn");
  if (!loggedIn) return Routes.login;

  print("state: ${state.matchedLocation}");

  final isLoggingIn =
      state.matchedLocation == Routes.splash ||
      state.matchedLocation == Routes.login;

  if (isLoggingIn) return Routes.home;

  return null;
}
