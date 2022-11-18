import 'package:flutter/material.dart';
import 'package:flutter_questions_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_questions_app/configs/themes/ui_parameters.dart';
import 'package:flutter_questions_app/controlllers/question_paper/questions_controller.dart';
import 'package:flutter_questions_app/screens/home/question_card.dart';
import 'package:flutter_questions_app/widgets/common/background_decoration.dart';
import 'package:flutter_questions_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_questions_app/widgets/common/main_button.dart';
import 'package:flutter_questions_app/widgets/content_area.dart';
import 'package:flutter_questions_app/widgets/questions/answer_card.dart';
import 'package:flutter_questions_app/widgets/questions/count_down_timer.dart';
import 'package:flutter_questions_app/widgets/questions/question_number_card.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static final String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(
                children: [
                  CountdownTimer(
                    color: UIParameters.isDarkMode()
                        ? Theme.of(context).textTheme.bodyText1!.color
                        : Theme.of(context).primaryColor,
                    time: '',
                  ),
                  Obx(
                    () => Text(
                      '${controller.time} Remaining',
                      style: countDownTimerTS(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: controller.allQuestions.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 85,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (_, index) {
                      AnswerStatus? _answerStatus;
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        _answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCard(
                          index: index + 1,
                          status: _answerStatus,
                          onTap: () {
                            controller.jumpToQuestion(index);
                          });
                    }),
              ),
            ],
          ))),
          ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: UIParameters.mobileScreenPadding,
              child: MainButton(
                ontap: () {
                  controller.complete();
                },
                title: 'Complete',
              ),
            ),
          )
        ],
      )),
    );
  }
}
