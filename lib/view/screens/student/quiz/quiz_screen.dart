import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/quiz/quiz_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/exams_widgets/exam_card.dart';
import 'package:school/view/widgets/general/no_data.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());

    return Scaffold(
      appBar: AppBar(
        title: Text("المذاكرات"),
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
          child: GetBuilder<QuizController>(
              builder: (examController) => HandlingDataRequest(
                  statusRequest: examController.statusRequest,
                  widget: examController.examsList.isEmpty
                      ? CustomNoData(text: 'لا يوجد مذاكرات  .')
                      : ListView.builder(
                          itemCount: examController.examsList.length,
                          itemBuilder: (context, index) {
                            final exam = examController.examsList[index];
                            return CustomExam(
                              type: 2,
                              exam: exam,
                              onTapDownload: () {
                                examController.downLoadExam(exam.file!);
                              },
                              onTapUpload: () {
                                examController.upload(exam.id.toString());
                              },
                              isChoose: false,
                              onPressedChoose: () {
                                examController.pickFileData();
                              },
                            );
                          },
                        )))),
    );
  }
}
