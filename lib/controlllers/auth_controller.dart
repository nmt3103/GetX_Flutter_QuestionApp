import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_questions_app/configs/logger/app_logger.dart';
import 'package:flutter_questions_app/firebase_ref/references.dart';
import 'package:flutter_questions_app/screens/home/home_screen.dart';
import 'package:flutter_questions_app/screens/introduction/introduction.dart';
import 'package:flutter_questions_app/screens/login/login_screen.dart';
import 'package:flutter_questions_app/widgets/dialogs/dialogue_widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });

    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);
        await saveUser(account);

        navigateToHomePage();
      }
    } on Exception catch (error) {
      // AppLogger.e(error);
      AppLogger.e(error);
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF
        .doc(account.email)
        .set({
          "email": account.email,
          "name": account.displayName,
          "profilepic": account.photoUrl
        })
        .then((_) => print("set value to firebase cloud success"))
        .onError((error, stackTrace) => print("error"));
  }

  Future<void> signOut() async {
    AppLogger.d('Sign out');
    try {
      await _auth.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void navigateToIntroduction() async {
    Get.offAllNamed(AppIntroductionScreen.routeName);
    // await Future.delayed(const Duration(seconds: 3));
    // Get.offAndToNamed("/home");
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(ontap: () {
        Get.back();
        navigateToLoginPage();
      }),
      barrierDismissible: false,
    );
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
