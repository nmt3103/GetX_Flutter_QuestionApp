import 'package:flutter/material.dart';
import 'package:flutter_questions_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_questions_app/controlllers/question_paper/questions_controller.dart';
import 'package:flutter_questions_app/models/question_paper_model.dart';
import 'package:flutter_questions_app/screens/question/result_screen.dart';
import 'package:flutter_questions_app/widgets/common/background_decoration.dart';
import 'package:flutter_questions_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_questions_app/widgets/content_area.dart';
import 'package:flutter_questions_app/widgets/questions/answer_card.dart';
import 'package:get/get.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({super.key});
  static const String routeName = "/answercheck";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
              style: appBarTS,
            )),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
          child: Obx(
        () => Column(
          children: [
            Expanded(
                child: ContentArea(
                    child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.currentQuestions.value!.question),
                  GetBuilder<QuestionsController>(
                    id: 'answer_review_list',
                    builder: (_) {
                      return ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 25),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final answer =
                              controller.currentQuestions.value!.answers[index];
                          final selectedAnswer =
                              controller.currentQuestions.value!.selectedAnswer;
                          final correctAnswer =
                              controller.currentQuestions.value!.correctAnswer;

                          final String answerText =
                              '${answer.identifier}. ${answer.answer}';
                          if (correctAnswer == selectedAnswer &&
                              answer.identifier == selectedAnswer) {
                            return CorrectAnswer(answer: answerText);
                          } else if (correctAnswer == answer.identifier) {
                            return CorrectAnswer(answer: answerText);
                          } else if (selectedAnswer == null) {
                            return NotAnswer(answer: answerText);
                          } else if (correctAnswer != selectedAnswer &&
                              answer.identifier == selectedAnswer) {
                            return WrongAnswer(answer: answerText);
                          }

                          return AnswerCard(
                            answer: answerText,
                            ontap: () {},
                            isSelected: false,
                          );
                        },
                        itemCount:
                            controller.currentQuestions.value!.answers.length,
                        separatorBuilder: (_, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            )))
          ],
        ),
      )),
    );
  }
}
