import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/exam/questions_controller.dart';

class CustomButtonsQuestions extends GetView<QuestionsControllerImp> {
  const CustomButtonsQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsControllerImp>(
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
