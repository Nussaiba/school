import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';

class CustomNoData extends StatelessWidget {
  const CustomNoData({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 18.0,
              color: AppColor.kTextLightColor,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
