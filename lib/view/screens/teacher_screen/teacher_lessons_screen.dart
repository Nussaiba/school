import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/teacher_lessons_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/screens/teacher_screen/lesson_content/teacher_lesson_content.dart';
import 'package:school/view/widgets/general/no_data.dart';
import 'package:school/view/widgets/lesson_widgets/lesson_card.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';

class TeacherLessonsScreen extends StatelessWidget {
  const TeacherLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
 final controller=  Get.put(TeacherLessonsController());

    return Scaffold(
      appBar: AppBar(
        title: Text('الدروس المتاحة للمدرس'),
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
          child: GetBuilder<TeacherLessonsController>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child:
                  controller.lessonsList.isEmpty?
                    CustomNoData(
                       
                          text:  'لا يوجد دروس  .'):
                 ListView.builder(
                  itemCount: controller.lessonsList.length,
                  itemBuilder: (context, lessonIndex) {
                    return LessonCard(
                      lesson: controller.lessonsList[lessonIndex],
                      onTap: () {
                        Get.to(() => TeacherLessonContents(), arguments: {
                          "lesson": controller.lessonsList[lessonIndex],
                          "room_id": controller.roomId
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        splashColor: AppColor.kpraimaryColor,
        hoverColor: AppColor.kpraimaryColor,
        foregroundColor: AppColor.kpraimaryColor,
        backgroundColor: AppColor.ksecondColor,
        onPressed: () {
          controller.showAddLessonDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

 