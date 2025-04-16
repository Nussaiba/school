
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';

class LessonName extends StatelessWidget {
  const LessonName({
    super.key,
    required this.name,
  });

final String name;
  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: AppColor.kTextBlackColor,
        fontWeight: FontWeight.w800,
        fontSize: 16.0,
      ));
  }
}
