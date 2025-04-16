import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/lesson_controller.dart';
import 'package:school/controller/teacher/classes_controller.dart';
import 'package:school/controller/teacher/rooms_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/data/model/teacher/class_model.dart';
import 'package:school/view/screens/teacher_screen/teacher_subjects_screen.dart';
import 'package:school/view/widgets/general/no_data.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/teacher_widgets/sections_widget/section_card.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});
  // final ClassModel classModel;
  @override
  Widget build(BuildContext context) {
    Get.put(RoomsController());

    return Scaffold(
      appBar: AppBar(
        title: Text('الشعب المدرسية'),
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
        child: GetBuilder<RoomsController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child:
                controller.roomsList.isEmpty?
                  CustomNoData(
                       
                          text:  'لا يوجد شعب  .'):
               ListView.builder(
                itemCount: controller.roomsList.length,
                itemBuilder: (context, index) {
                  final section = controller.roomsList[index];
                  return InkWell(
                      onTap: () {
                        Get.to(() => TeacherSubjectsScreen(),
                        
                        arguments: {
                          "room_id" :section.id.toString()
                        }
                        );
                      },
                      child: SectionCard(roomModel: section));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
