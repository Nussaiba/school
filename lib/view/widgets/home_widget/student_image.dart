import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_routes.dart';

class StudentImage extends StatelessWidget {
  const StudentImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      
      child: Image.asset(
        AppImageAsset.logo,
      ),
    );
  }
}
