import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/lesson_content/start_test_controller.dart';

class CustomButtonsTest extends GetView<StartTestImp> {
  const CustomButtonsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartTestImp>(
      init: controller,
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () => controller.previousPage(),
            child: Text('السابق'),
          ),
          ElevatedButton(
            onPressed: () => controller.nextPage(),
            child: Text(controller.currentPage == controller.questionsList.length -1?'إنهاء': 'التالي'),
          ),
        ],
      ),
    );
  }
}
