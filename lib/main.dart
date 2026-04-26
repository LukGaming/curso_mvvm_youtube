import 'package:curso_mvvm_youtube/config/dependencies.dart';
import 'package:curso_mvvm_youtube/routing/router.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
