import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibe/firebase_options.dart';

import 'app/_commons/app_services/injector.dart';
import 'app/_commons/app_services/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupInjector();

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
