
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/data/model/assignment_model.dart';
import 'package:school/data/model/model2.dart';
import 'package:school/data/model/student/lesson_details/lesson_details_model.dart';
import 'package:school/view/widgets/assignments_widget/assignment_button.dart';
import 'package:school/view/widgets/assignments_widget/detail.dart';
import 'package:school/view/widgets/assignments_widget/lesson_name.dart';
import 'package:school/view/widgets/assignments_widget/subject_name.dart';

class AssignmentCard extends StatelessWidget {
  const AssignmentCard({
    super.key,
    required this.assignment, this.subjectsModel, this.onTap,
  });

  final SubjectsModel ?subjectsModel;
final LessonDetailsModel assignment;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: AppPadding.kDefaultPadding / 2,
      ),
      padding: EdgeInsets.all(AppPadding.kDefaultPadding),
      decoration: BoxDecoration(
          color: AppColor.kOtherColor,
          border: Border.all(
            color: AppColor.kTextLightColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding),
          boxShadow: [
            BoxShadow(
              color: AppColor.kTextLightColor,
            )
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SubjectName(name: subjectsModel!.name!),
        SizedBox(
          height: AppPadding.kDefaultPadding / 2,
        ),
        LessonName(name: assignment.nameHomework!),
        SizedBox(
          height: AppPadding.kDefaultPadding / 2,
        ),
        AssignmentDetail(
            text1: 'تاريخ الواجب', text2: assignment.startTime!.substring(0,10)),
        SizedBox(
          height: AppPadding.kDefaultPadding / 4,
        ),
        AssignmentDetail(text1: 'اّخر مهلة ', text2:assignment.endTime!.substring(0,10)),
        SizedBox(
          height: AppPadding.kDefaultPadding / 4,
        ),
        // AssignmentDetail(text1: 'الحالة', text2: assignment.status!),
        SizedBox(
          height: AppPadding.kDefaultPadding / 2,
        ),
        // assignment.status! == 'جديدة' ? AssignmentButton() : Container(),
         GestureDetector(
          onTap: onTap,child: AssignmentButton()) ,
      ]),
    );
  }
}
