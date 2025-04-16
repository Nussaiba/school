import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/lesson_content/lesson_details_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/assignments_widget/assignment_card.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';

class LessonAssignments extends StatelessWidget {
  const LessonAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(AssignmentController());
    final LessonDetailsController controller = Get.find();

    return GetBuilder<LessonDetailsController>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Container(
          color: AppColor.kOtherColor,
          child: controller.lessonDetailListHomeWorks.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.all(AppPadding.kDefaultPadding),
                  itemCount: controller.lessonDetailListHomeWorks.length,
                  itemBuilder: (context, index) {
                    final file = controller.lessonDetailListHomeWorks[index];

                    return AssignmentCard(
                        onTap: () {
                      print("========================================");
                      
                      // file.testLink != null
                      //     ? controller.launchURL(file.testLink!)
                      //     : controller.launchFile(file.test!);

                     
                        if (file.testLink != null) {
                          controller.launchURL(file.testLink!);
                        } else {
                         controller.launchURL(
                              "${AppLink.serverimage}/${file.test!}");
                        }
                    
                    },
                      assignment: controller.lessonDetailListHomeWorks[index],
                      subjectsModel: controller.subjectsModel,
                    );
                  },
                )
              : buildTabContent(
                  icon: Icons.assignment_turned_in,
                  message: 'لا توجد وظائف بعد.'),
        ),
      ),
    );
  }
}
