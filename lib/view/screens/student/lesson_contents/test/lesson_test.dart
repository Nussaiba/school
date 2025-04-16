import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/lesson_content/lesson_details_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/lessons_contents/test/test_card.dart';

class LessonTest extends StatelessWidget {
  const LessonTest({super.key});

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
                  itemCount: controller.lessonDetailListTests.length,
                  itemBuilder: (context, index) {
                    return TestCard(exam: controller.lessonDetailListTests[index]);
                  },
                )
              : buildTabContent(
                  icon: Icons.assignment_turned_in,
                  message: 'لا توجد اختبارات بعد.'),
        ),
      ),
    );
  }
}
