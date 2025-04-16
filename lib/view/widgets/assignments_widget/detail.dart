import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';

class AssignmentDetail extends StatelessWidget {
  const AssignmentDetail({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColor.kTextLightColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                )),
        Text(text2,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColor.kTextBlackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                )),
      ],
    );
  }
}
