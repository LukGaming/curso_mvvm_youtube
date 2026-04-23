import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository_remote.dart';
import 'package:curso_mvvm_youtube/data/services/api/api_client.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/auth/login/widgets/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: LoginScreen(
        loginViewmodel: LoginViewmodel(
          authRepository: AuthRepositoryRemote(
            apiClient: ApiClient(apiUrl: "https://dummyjson.com", dio: Dio()),
          ),
        ),
      ),
    );
  }
}
