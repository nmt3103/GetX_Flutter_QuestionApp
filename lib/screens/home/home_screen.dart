import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_questions_app/configs/themes/app_colors.dart';
import 'package:flutter_questions_app/configs/themes/app_dark_theme.dart';
import 'package:flutter_questions_app/configs/themes/app_icons.dart';
import 'package:flutter_questions_app/configs/themes/app_light_theme.dart';
import 'package:flutter_questions_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_questions_app/configs/themes/ui_parameters.dart';
import 'package:flutter_questions_app/controlllers/question_paper/question_paper_controller.dart';
import 'package:flutter_questions_app/controlllers/zoom_drawer_controller.dart';
import 'package:flutter_questions_app/screens/home/menu_screen.dart';
import 'package:flutter_questions_app/screens/home/question_card.dart';
import 'package:flutter_questions_app/widgets/app_circle_button.dart';
import 'package:flutter_questions_app/widgets/content_area.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerControler> {
  const HomeScreen({super.key});
  static final String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerControler>(
        builder: (_) {
          return ZoomDrawer(
            borderRadius: 50.0,
            controller: _.zoomDrawerController,
            showShadow: true,
            angle: 0.0,
            menuBackgroundColor: UIParameters.isDarkMode()
                ? primaryDarkColorDark
                : primaryLightColorLight,
            style: DrawerStyle.defaultStyle,
            slideWidth: MediaQuery.of(context).size.width * 0.8,
            menuScreen: const MyMenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCircleButton(
                            onTap: controller.toggleDrawer,
                            child: const Icon(AppIcons.menuLeft),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  AppIcons.peace,
                                ),
                                Text(
                                  "Hello friend",
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            "What do you want to learn today?",
                            style: headerText,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(
                            () => ListView.separated(
                                padding: UIParameters.mobileScreenPadding,
                                itemBuilder: (BuildContext context, int index) {
                                  return QuestionCard(
                                      model: _questionPaperController
                                          .allPapers[index]);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount:
                                    _questionPaperController.allPapers.length),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
