import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomSendButton extends StatelessWidget {
  const CustomSendButton({
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
        left: AppPadding.kDefaultPadding / 2,
        right: AppPadding.kDefaultPadding / 2,
      ),
      width: Get.width / 2,
      height: 50.0,
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
          Text(title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Colors.white,
                  )),
          SizedBox(width: 20),
          Icon(icon, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}