import 'package:flutter_questions_app/controlllers/question_paper/question_paper_controller.dart';
import 'package:flutter_questions_app/controlllers/question_paper/questions_controller.dart';
import 'package:flutter_questions_app/controlllers/zoom_drawer_controller.dart';
import 'package:flutter_questions_app/screens/home/home_screen.dart';
import 'package:flutter_questions_app/screens/introduction/introduction.dart';
import 'package:flutter_questions_app/screens/login/login_screen.dart';
import 'package:flutter_questions_app/screens/question/answer_check_screen.dart';
import 'package:flutter_questions_app/screens/question/question_screen.dart';
import 'package:flutter_questions_app/screens/question/result_screen.dart';
import 'package:flutter_questions_app/screens/question/test_overview_screen.dart';
import 'package:get/get.dart';

import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
        GetPage(
            name: AppIntroductionScreen.routeName,
            page: () => const AppIntroductionScreen()),
        GetPage(
            name: HomeScreen.routeName,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(QuestionPaperController());
                Get.put(MyZoomDrawerControler());
              },
            )),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder(
              () {
                Get.put<QuestionsController>(QuestionsController());
              },
            )),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => AnswerCheckScreen(),
        ),
      ];
}
