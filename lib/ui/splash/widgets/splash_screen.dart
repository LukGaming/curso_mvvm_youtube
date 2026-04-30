import 'package:curso_mvvm_youtube/data/repositories/auth/auth_repository.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final AuthRepository authRepository;
  const SplashScreen({super.key, required this.authRepository});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.authRepository.verifyLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
