import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/exam/questions_controller.dart';
import 'package:school/core/constants/app_color.dart';

class CustomDotControllerQuestions extends StatelessWidget {
  const CustomDotControllerQuestions({super.key});

  @override
  Widget build(BuildContext context) {
       QuestionsControllerImp con = Get. find();

    return GetBuilder<QuestionsControllerImp>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(
                right: 35,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                     con.questionsList.length,
                      (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 8),
                        duration: const Duration(milliseconds: 900),
                        width: controller.currentPage == index ? 18 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: controller.currentPage == index
                                ? AppColor.kpraimaryColor
                                : AppColor.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
