import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/data/model/student/lesson_details/test_model.dart';

import 'package:school/view/widgets/assignments_widget/detail.dart';

class TestCard extends StatelessWidget {
  const TestCard({
    super.key,
    required this.exam,
    this.onTapDownload,
    this.onTapUpload,
    this.onPressedChoose,
  });

  final TestModel exam;
  final void Function()? onTapDownload;
  final void Function()? onTapUpload;
  final void Function()? onPressedChoose;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          // margin: EdgeInsets.all(8),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            margin: EdgeInsets.all(AppPadding.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exam.lesson!.name!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.kTextBlackColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                        height: 2)),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                Text(
                  exam.nameQuiz1!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.kTextLightColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0,
                      ),
                ),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                    text1: "مدة الامتحان", text2: "${exam.period!} دقيقة"),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                    text1: "بدء الامتحان",
                    text2: "${exam.startTime!.toString().substring(0, 16)} "),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                    text1: "انتهاء الامتحان",
                    text2: " ${exam.endTime.toString()!.substring(0, 16)} "),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                  text1: "الدرجة النهائية",
                  text2: " ${exam.successMark}",
                ),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                  text1: "حالة الامتحان",
                  text2: exam.status == '9'
                      ? 'الاختبار قيد التصحيح'
                      : exam.status == '2'
                          ? 'معاينة'
                          : exam.status == '4' 
                          ? 'انتهى'
                          : exam.status == '3'
                              ? 'متاح'
                              : '',
                ),
                SizedBox(
                  height: AppPadding.kDefaultPadding,
                ),
                exam.status == '2'
                    ? InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.resultTest,
                              arguments: {'examId': exam.id});
                        },
                        child: CustomButton(
                          title: 'معاينة الامتحان',
                        ),
                      )
                    : Container(),
             exam.status == '3'
                    ? InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.startTest,
                              arguments: {'examId': exam.id});
                        },
                        child: CustomButton(
                          title: 'تقديم الامتحان',
                        ))
                    : Container(),
              ],
            ),
          ),
        ),
        Positioned(
          top: 28,
          left: 18,
          child: Image.asset(
            AppImageAsset.examIcon,
            height: 62,
            width: 62,
          ),
        )
      ],
    );
  }
}

class CustomHalfButton extends StatelessWidget {
  const CustomHalfButton({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppPadding.kDefaultPadding / 2,
        right: AppPadding.kDefaultPadding / 2,
      ),
      height: 42.0,
      width: Get.width / 3.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.ksecondColor,
                AppColor.kpraimaryColor,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [
                0.0,
                1.0,
              ],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding)),
      child: Center(
        child: Text(title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                )),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppPadding.kDefaultPadding / 2,
        right: AppPadding.kDefaultPadding / 2,
      ),
      width: double.infinity,
      height: 42.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.ksecondColor,
                AppColor.kpraimaryColor,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [
                0.0,
                1.0,
              ],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  )),
          Spacer(),
        ],
      ),
    );
  }
}
