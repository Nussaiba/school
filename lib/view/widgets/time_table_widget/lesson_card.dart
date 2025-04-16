import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/time_table_controller.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/data/model/schedule_model.dart';
import 'package:school/view/widgets/exams_widgets/exam_card.dart';

class CustomLessonCard extends StatelessWidget {
  const CustomLessonCard({
    super.key,
    required this.lesson,
    required this.lectureTime, this.onTap,
  });

  final Lesson lesson;
  final LectureTime lectureTime;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppPadding.kDefaultPadding * 1.5),
          bottomRight: Radius.circular(AppPadding.kDefaultPadding * 1.5),
        ),
        border: Border.all(
          color: AppColor.ksecondColor,
          width: 1,
        ),
      ),
      margin: EdgeInsets.all(4.0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(16),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lesson.lesson!.name!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        color: AppColor.ksecondColor,
                        height: 1.5)),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
            subtitle: Text(
                "المدرس: ${lesson.teacher!.firstName! + lesson.teacher!.lastName!}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: AppColor.kTextLightColor)),
            trailing: Text(
                lectureTime.startTime!.substring(0, 5) +
                    " - " +
                    lectureTime.endTime!.substring(0, 5),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: AppColor.kpraimaryColor)),
          ),
          lesson.meetingLink != null
              ? InkWell(
      onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: CustomButton(
                            title: 'الذهاب للدرس',
                          ),
                ),
              )
              : SizedBox(
                  height: 0,
                ),
                SizedBox(
                  height: 20,
                ),
        ],
      ),
    );
  }
}
