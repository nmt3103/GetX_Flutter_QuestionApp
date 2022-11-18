import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_questions_app/bindings/initial_bindings.dart';
import 'package:flutter_questions_app/controlllers/theme_controller.dart';
import 'package:flutter_questions_app/route/app_routes.dart';

import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
  // runApp(GetMaterialApp(
  //   home: DataUploaderScreen(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
