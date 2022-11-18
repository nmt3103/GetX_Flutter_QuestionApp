import 'package:flutter/material.dart';
import 'package:flutter_questions_app/configs/themes/app_colors.dart';
import 'package:flutter_questions_app/screens/home/home_screen.dart';
import 'package:flutter_questions_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});
  static final String routeName = "/introduction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: onSurfaceTextColor,
                      fontWeight: FontWeight.bold),
                  "This is a study app, You can use it as you want. If you understand how it works you would be able to scale it. With this you will master firebase backend and flutter front end. "),
              const SizedBox(
                height: 40,
              ),
              // ElevatedButton(onPressed: () => ("taptap"), child: Text("test")),
              AppCircleButton(
                  onTap: () => Get.offAndToNamed("/home"),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
