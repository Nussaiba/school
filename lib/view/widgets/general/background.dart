
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
         
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
          tileMode: TileMode.clamp,)
          ),
      child: widget
    );
  }
}
