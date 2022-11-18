import 'package:flutter/material.dart';
import 'package:flutter_questions_app/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static final String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
