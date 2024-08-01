import 'package:flutter/material.dart';

import 'app/_commons/app_services/injector.dart';
import 'app/_commons/app_services/routers.dart';

void main() {
  setupInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Vibe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Routers.router,
    );
  }
}
