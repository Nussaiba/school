import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/data/model/model2.dart';

class GridSubjectItem extends StatelessWidget {
  final SubjectsModel lesson;
  const GridSubjectItem({
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //   color: Colors.deepOrangeAccent,
          //   width: 2.0,
          // ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //  // icon,
            //  Icons.school_outlined,
            //   size: 50,
            //   color: AppColor.ksecondColor,
            // ),
            Image.asset(
              AppImageAsset.book,
              height: 54,
              width: 54,
            ),
            SizedBox(height: 10),
            Text(
              lesson.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColor.kTextBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
