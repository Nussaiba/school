import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppPadding.kDefaultPadding,
        right: AppPadding.kDefaultPadding,
      ),
      padding: EdgeInsets.only(
        right: AppPadding.kDefaultPadding,
      ),
      width: double.infinity,
      height: 68.0,
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
          Text('تسجيل الدخول',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  )),
          Spacer(),
          Icon(Icons.arrow_forward_outlined,
              size: 30.0, color: AppColor.kOtherColor)
        ],
      ),
    );
  }
}