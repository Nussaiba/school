import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/subject_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/view/widgets/subject_widgets/grid_subject_item.dart';

class SubjectsPage extends StatelessWidget {
 

   SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SubjectController());
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
            child: GetBuilder<SubjectController>(
                builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequestSubjects,
                  widget:  Padding(
                        padding: EdgeInsets.all(AppPadding.kDefaultPadding / 2),
                        child: Center(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: controller.subjectsList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {

                                  Get.toNamed(AppRoute.lessonsPage,
                                   arguments: {'subjectsId':  controller.subjectsList[index].id});
                                },
                                child: GridSubjectItem(
                                  // name: controller.subjectsItems[index].name!,
                                  // icon: controller.subjectsItems[index].icon!,
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
