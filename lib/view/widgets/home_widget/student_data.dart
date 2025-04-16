
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomContainerHome extends StatelessWidget {
  const CustomContainerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // width: MediaQuery.of(context).size.width / 2.5,
        // height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
           boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // لون الظل
                  spreadRadius: 2, // مدى انتشار الظل
                  blurRadius: 3, // مدى تلطيف الظل
                  offset: Offset(0, 1), // موضع الظل
                ),
              ],
          color: AppColor.kOtherColor,
          borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'محتوى الدرس الأول',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColor.kTextBlackColor,
                      fontSize: 16.0,
                    ),
              ),
              Text(
                '90.02 %',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColor.kTextBlackColor,
                      fontSize: 25.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}