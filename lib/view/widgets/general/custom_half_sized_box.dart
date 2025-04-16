
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomHalfSizedBox extends StatelessWidget {
  const CustomHalfSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppPadding.kDefaultPadding / 2.0,
    );
  }
}