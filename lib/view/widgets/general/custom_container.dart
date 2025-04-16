import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomBackgroundContainer extends StatelessWidget {
  const CustomBackgroundContainer({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
        color: AppColor.kOtherColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
          topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
        ),
      ),
      child: Padding(
          padding: EdgeInsets.all(AppPadding.kDefaultPadding), child: widget),
    );
  }
}
