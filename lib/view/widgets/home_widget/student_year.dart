
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class StudentYear extends StatelessWidget {
  const StudentYear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 20,
      decoration: BoxDecoration(
        color: AppColor.kOtherColor,
        borderRadius: BorderRadius.circular(
          AppPadding.kDefaultPadding,
        ),
      ),
      child: Center(
        child: Text('2024-2025',
            style: TextStyle(
              fontSize: 12.0,
              color: AppColor.kTextLightColor,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}