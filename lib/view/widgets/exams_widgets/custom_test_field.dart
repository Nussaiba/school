import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/exam/questions_controller.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.con,
    this.onChanged,
    this.textcontroller,
  });

  final QuestionsControllerImp con;
  final void Function(String)? onChanged;
  final TextEditingController? textcontroller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsControllerImp>(
      builder: (controller) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding),
                border: Border.all(
                  color: AppColor.kpraimaryColor,
                  width: 1,
                ),
              ),
              margin: EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textcontroller,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.kTextBlackColor,
                        fontSize: 16.0,
                      ),
                  maxLines: null,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "اكتب إجابتك هنا...",
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
          ),
        );
      },
    );
  }
}
