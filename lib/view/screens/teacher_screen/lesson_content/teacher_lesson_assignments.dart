import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/lesson_contents/lesson_details_teacher_controller.dart';
import 'package:school/controller/teacher/lesson_contents/add/teacher_assignment_controller.dart';
import 'package:school/core/class/handlingdataview.dart';

// import 'package:intl/intl.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/assignments_widget/assignment_card.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';

class TeacherLessonAssignments extends StatelessWidget {
  const TeacherLessonAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonDetailsTeacherController controller = Get.find();
    final TeacherAssignmentController con =
        Get.put(TeacherAssignmentController());
    return Scaffold(
        backgroundColor: AppColor.kOtherColor,
        body:  GetBuilder<TeacherAssignmentController>(
                builder: (con) => HandlingDataRequest(
                  statusRequest: con.statusRequest,
                  widget: GetBuilder<LessonDetailsTeacherController>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: AppColor.kOtherColor,
                  child: controller.lessonDetailListHomeWorks.isNotEmpty
                      ? ListView.builder(
                              padding: EdgeInsets.all(AppPadding.kDefaultPadding),
                              itemCount: controller.lessonDetailListHomeWorks.length,
                              itemBuilder: (context, index) {
                                final file =
                                    controller.lessonDetailListHomeWorks[index];
                                return GestureDetector(
                                  onTap: () {
                                    file.testLink != null
                                        ? controller.launchURL(file.testLink!)
                                        : controller.launchFile(file.test!);
                                  },
                                  child: AssignmentCard(
                                    assignment:
                                        controller.lessonDetailListHomeWorks[index],
                                    subjectsModel: controller.subjectsModel,
                                  ),
                                );
                              },
                            )
                       
                      : buildTabContent(
                          icon: Icons.assignment_turned_in,
                          message: 'لا توجد وظائف بعد.'),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: AppColor.kpraimaryColor,
          hoverColor: AppColor.kpraimaryColor,
          foregroundColor: AppColor.kpraimaryColor,
          backgroundColor: AppColor.ksecondColor,
          onPressed: () {
            con.showHomeWorkDialog();
          },
          child: Icon(Icons.add),
        ));
  }
}
