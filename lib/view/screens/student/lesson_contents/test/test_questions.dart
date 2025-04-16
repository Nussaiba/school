import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school/controller/student/lesson_content/start_test_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/exams_widgets/buttons_questions.dart';
import 'package:school/view/widgets/exams_widgets/dot_questions.dart';
import 'package:school/view/widgets/exams_widgets/slider.dart';
import 'package:school/view/widgets/lessons_contents/test/button.dart';
import 'package:school/view/widgets/lessons_contents/test/dot.dart';
import 'package:school/view/widgets/lessons_contents/test/slider.dart';

class TestScreen extends GetView<StartTestImp> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StartTestImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('الامتحان'),
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
          child: ListView(
            children: [
              GetBuilder<StartTestImp>(
                builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    height: Get.height *0.8,
                    child: CustomSliderTest(),
                  ),
                ),
              ),
              CustomDotControllerTest(),
               Container(
                    height: Get.height *0.1,
                child: CustomButtonsTest(),
              )
            ],
          )),
    );
  }
}
