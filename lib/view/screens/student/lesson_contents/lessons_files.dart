import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/lesson_content/lesson_details_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/lessons_contents/pdf_card.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonFilesGrid extends StatelessWidget {
  const LessonFilesGrid({super.key});


  @override
  Widget build(BuildContext context) {
    final LessonDetailsController controller = Get.find();

    return GetBuilder<LessonDetailsController>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 30, 16.0, 0),
          child: controller.dataLessonDetail.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: controller.lessonDetailList.length,
                  itemBuilder: (context, index) {
                    final file = controller.lessonDetailList[index];
                    // return InkWell(

                    //     onTap: () {
                    //       file.additionLink != null
                    //           ? controller.launchURL(file.additionLink!)
                    //           : controller.launchFile(file.addition!);
                    //     },
                    // child: FileWidget(file: file));
                    return GestureDetector(
                      onTap: () {
                        if (file.additionLink != null) {
                          controller.launchURL(file.additionLink!);
                        } else {
                         controller.launchURL(
                              "${AppLink.serverimage}/${file.addition!}");
                        }
                      },
                      child: FileWidget(file: file),
                    );
                  },
                )
              : buildTabContent(
                  icon: Icons.assignment_turned_in,
                  message: 'لا توجد ملفات بعد.'),
        ),
      ),
    );
  }
}
