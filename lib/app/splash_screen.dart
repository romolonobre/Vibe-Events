import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe/app/_commons/vibe_ui/palette/vui_palette.dart';
import 'package:vibe/app/_commons/vibe_ui/typography/vui_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      context.goNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Vibe",
            style: TextStyle(
              color: VUIPalette.primaryColor,
              fontSize: 68,
              fontWeight: FontWeight.bold,
            ),
          ),
          VUIText.content("Connec, Discover, Enjoy", fontsize: 14)
        ],
      ),
    ));
  }
}
