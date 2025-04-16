import 'package:flutter/material.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppPadding.kDefaultPadding);
  }

}
