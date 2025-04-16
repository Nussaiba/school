import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/lesson_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/screens/student/lesson_contents/lesson_contents.dart';
import 'package:school/view/widgets/general/no_data.dart';
import 'package:school/view/widgets/lesson_widgets/lesson_card.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LessonsController());

    return Scaffold(
        appBar: AppBar(
          title: Text('الدروس المتاحة'),
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
            child: GetBuilder<LessonsController>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: controller.lessonsList.isEmpty
                      ? CustomNoData(
                          text: "لا يوجد دروس ",
                        )
                      : ListView.builder(
                          itemCount: controller.lessonsList.length,
                          itemBuilder: (context, lessonIndex) {
                            return LessonCard(
                              lesson: controller.lessonsList[lessonIndex],
                              onTap: () {
                                Get.to(() => LessonContents(), arguments: {
                                  "lesson": controller.lessonsList[lessonIndex],
                                });
                              },
                            );
                          },
                        ),
                ),
              ),
            )));
  }
}
