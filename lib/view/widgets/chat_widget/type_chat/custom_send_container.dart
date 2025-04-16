import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomSendContainer extends StatelessWidget {
  const CustomSendContainer({
    super.key, this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding),
          border: Border.all(
            color: AppColor.kpraimaryColor,
            width: 1,
          ),
        ),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.kTextBlackColor,
                  fontSize: 16.0,
                ),
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: "اكتب رسالتك هنا...",
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.kTextLightColor,
                    fontSize: 16.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}