import 'package:get/get.dart';
import 'package:school/controller/student/exam/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/exams_widgets/buttons_questions.dart';
import 'package:school/view/widgets/exams_widgets/dot_questions.dart';
import 'package:school/view/widgets/exams_widgets/slider.dart';

// class QuizPage extends GetView<QuestionsControllerImp> {
class QuizPage extends GetView<QuestionsControllerImp> {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuestionsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('الامتحان'),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
              color: AppColor.kOtherColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
                topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
              )),
          clipBehavior: Clip.antiAlias,
          child: ListView(
            // physics: NeverScrollableScrollPhysics(),
            //         shrinkWrap: true,

            children: [
              GetBuilder<QuestionsControllerImp>(
                builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    height: Get.height *0.8,
                    child: CustomSliderQuesions()),
                ),
              ),
            CustomDotControllerQuestions(),
             Container(
                    height: Get.height *0.1,
                    child: CustomButtonsQuestions())
            ],
          )),
    );
  }
}
