import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/lesson_contents/lesson_details_teacher_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/data/model/student/lesson_details/lesson_details_model.dart';
import 'package:school/view/widgets/assignments_widget/detail.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';

class TeacherLessonTest extends StatelessWidget {
  const TeacherLessonTest({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final LessonDetailsTeacherController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColor.kOtherColor,
      body: GetBuilder<LessonDetailsTeacherController>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            color: AppColor.kOtherColor,
            child: controller.lessonDetailListTests.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.all(AppPadding.kDefaultPadding),
                    itemCount: controller.lessonDetailListTests.length,
                    itemBuilder: (context, index) {
                      return ShowTest(
                          test: controller.lessonDetailListTests[index]);
                    },
                  )
                : buildTabContent(
                    icon: Icons.assignment_turned_in,
                    message: 'لا توجد اختبارات بعد.'),
          ),
        ),
      ),
    );
  }
}

class ShowTest extends StatelessWidget {
  const ShowTest({super.key, required this.test});
  final LessonDetailsModel test;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 10.0),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.all(0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              margin: EdgeInsets.all(AppPadding.kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   SizedBox(
                    height: AppPadding.kDefaultPadding /2,
                  ),
                 
                  Center(
                    child: Text("${test.nameQuiz1!}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColor.kTextBlackColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0,
                            height: 2)),
                  ),
                  SizedBox(
                    height: AppPadding.kDefaultPadding ,
                  ),
                 
                  SizedBox(
                    height: AppPadding.kDefaultPadding/2 ,
                  ),
                  AssignmentDetail(
                      text1: "مدة الامتحان", text2: "${test.type!} دقيقة"),
                  SizedBox(
                    height: AppPadding.kDefaultPadding / 2,
                  ),
                  AssignmentDetail(
                      text1: "بدء الامتحان",
                      text2: "${test.startTime!.toString().substring(0, 16)} "),
                  SizedBox(
                    height: AppPadding.kDefaultPadding / 2,
                  ),
                  AssignmentDetail(
                      text1: "انتهاء الامتحان",
                      text2: " ${test.endTime.toString()!.substring(0, 16)} "),
                  SizedBox(
                    height: AppPadding.kDefaultPadding / 2,
                  ),
                  AssignmentDetail(
                    text1: "الدرجة النهائية",
                    text2: " ${test.successMark}",
                  ),
                  SizedBox(
                    height: AppPadding.kDefaultPadding / 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 28,
            left: 18,
            child: Image.asset(
              AppImageAsset.examIcon,
              height: 55,
              width: 55,
            ),
          )
        ],
      ),
    );
  }
}
