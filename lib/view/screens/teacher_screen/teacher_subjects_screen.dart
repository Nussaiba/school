import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/teacher_subjects_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/view/widgets/general/no_data.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/subject_widgets/grid_subject_item.dart';

class TeacherSubjectsScreen extends StatelessWidget {
  const TeacherSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TeacherSubjectsController());
    return Scaffold(
        appBar: AppBar(
          title: Text('المواد الدراسية'),
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
            child: GetBuilder<TeacherSubjectsController>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequestSubjects,
                      widget: Padding(
                        padding: EdgeInsets.all(AppPadding.kDefaultPadding / 2),
                        child: Center(
                          child: controller.subjectsList.isEmpty
                              ? CustomNoData(text: 'لا يوجد مواد  .')
                              : GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: controller.subjectsList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoute.teacherLessons,
                                            arguments: {
                                              'subjectsId': controller
                                                  .subjectsList[index].id,
                                              "room_id": controller.roomId
                                            });
                                        // Get.to(TeacherLessonsScreen(), arguments: {'subjectsId':  controller.subjectsList[index].id});
                                      },
                                      child: GridSubjectItem(
                                        lesson: controller.subjectsList[index],
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ))));
  }
}
