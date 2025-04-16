import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';

import '../../../data/model/lessons_model.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    super.key,
    this.onTap,
    required this.lesson,
  });

  final void Function()? onTap;
  final Lesson lesson;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.kOtherColor,
      margin: EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 2,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              maxRadius: 38,
              minRadius: 38,
              backgroundColor: AppColor.ksecondColor,
              backgroundImage: AssetImage(
                AppImageAsset.book,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(lesson.name!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: AppColor.kpraimaryColor)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                lesson.lectureTime != null?  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "التاريخ: ${lesson.lectureTime}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColor.kTextLightColor),
                      ),
                    ],
                  ):Container(),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.kpraimaryColor,
              ),
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
