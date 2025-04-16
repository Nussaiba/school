import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/data/model/exams_model.dart';
import 'package:school/view/widgets/assignments_widget/detail.dart';

class CustomExam extends StatelessWidget {
  const CustomExam({
    super.key,
    required this.exam,
    this.onTapDownload,
    this.onTapUpload,
    this.onPressedChoose,
    this.openSelectedFile,
    required this.isChoose,
    required this.type,
  });

  final ExamModel exam;
  final void Function()? onTapDownload;
  final void Function()? onTapUpload;
  final void Function()? onPressedChoose;
  final bool isChoose;
  final int type;
  final void Function()? openSelectedFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.all(8),
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
                  exam.name!,
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
                    text2: "${exam.startDate!.substring(0, 16)} "),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                    text1: "انتهاء الامتحان",
                    text2: " ${exam.endDate!.substring(0, 16)} "),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                  text1: "الدرجة النهائية",
                  text2:
                      "${exam.startExam == 3 && exam.result != '-9' ? "${exam.result}  / " : ""}  ${exam.mark}",
                ),
                SizedBox(
                  height: AppPadding.kDefaultPadding / 2,
                ),
                AssignmentDetail(
                  text1: "حالة الامتحان",
                  text2: exam.startExam == 0
                      ? 'الإمتحان منتهي'
                      : exam.startExam == 3 && exam.result == '-9'
                          ? 'الامتحان قيد التصحيح'
                          : exam.startExam == 3 && exam.result != '-9'
                              ? 'تم تقديم هذا الامتحان'
                              : exam.startExam == 2
                                  ? 'لم يحن موعده'
                                  : exam.startExam == 1
                                      ? 'متاح'
                                      : '',
                ),
                SizedBox(
                  height: AppPadding.kDefaultPadding,
                ),
                exam.startExam == 3 && exam.result != '-9' && exam.isFile != 1
                    ? InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.examResult,
                              arguments: {'examId': exam.id});
                        },
                        child: CustomButton(
                          title:
                              type == 1 ? 'معاينة الامتحان' : 'معاينة المذاكرة',
                        ),
                      )
                    : Container(),
                exam.startExam == 1 && exam.isFile == 0
                    ? InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.quizScreen,
                              arguments: {'examId': exam.id, 'type': type});
                        },
                        child: CustomButton(
                          title:
                              type == 1 ? 'تقديم الامتحان' : 'تقديم المذاكرة',
                        ),
                      )
                    : exam.startExam == 1 && exam.isFile == 1
                        ? Column(
                            children: [
                              Row(mainAxisSize: MainAxisSize.min, children: [
                                InkWell(
                                    onTap: onTapDownload,
                                    child: CustomHalfButton(
                                      title: "تحميل",
                                    )),
                                InkWell(
                                    onTap: onTapUpload,
                                    child: CustomHalfButton(
                                      title: "رفع ملف",
                                    )),
                                Center(
                                  child: IconButton(
                                      icon: Icon(Icons.upload_file),
                                      iconSize: 28.0,
                                      color: isChoose
                                          ? AppColor.ksecondColor
                                          : AppColor.kpraimaryColor,
                                      onPressed: onPressedChoose),
                                ),
                              ]),
                              SizedBox(
                                height: 8,
                              ),
                              isChoose
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                          Text(
                                            "تم اختيار ملف ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  fontSize: 17.0,
                                                  color:
                                                      AppColor.kTextLightColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: openSelectedFile,
                                            child: Text(
                                              " فتح",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontSize: 18.0,
                                                    color:
                                                        AppColor.kpraimaryColor,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                            ),
                                          ),
                                        ])
                                  : Container(),
                            ],
                          )
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
