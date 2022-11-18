import 'package:flutter_questions_app/controlllers/auth_controller.dart';
import 'package:flutter_questions_app/controlllers/theme_controller.dart';
import 'package:flutter_questions_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);

    Get.lazyPut(() => FirebaseStorageService());
  }
}
