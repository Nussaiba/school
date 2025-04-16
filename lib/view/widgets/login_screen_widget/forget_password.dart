import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';

class CustomForgetPasswod extends StatelessWidget {
  const CustomForgetPasswod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        'نسيت كلمة السر؟',
        textAlign: TextAlign.end,
        style: TextStyle(color: AppColor.kpraimaryColor, fontSize: 15.0),
      ),
    );
  }
}
