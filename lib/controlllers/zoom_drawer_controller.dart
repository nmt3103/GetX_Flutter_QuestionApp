import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_questions_app/controlllers/auth_controller.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerControler extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    // TODO: implement onReady
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void website() {
    _launch("https://www.google.com/");
  }

  void facebook() {
    _launch("https://www.facebook.com/profile.php?id=100006149769701");
  }

  void email() {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'tien31032000@gmail.com');
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
}
