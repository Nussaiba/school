import 'package:flutter/material.dart';
import 'package:school/controller/teacher/classes_controller.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/data/model/model2.dart';
import 'package:school/data/model/teacher/class_model.dart';

class ClassCard extends StatelessWidget {
  //final String name;
  final ClassModel classModel ;
  // final IconData icon;
  const ClassCard({
    required this.classModel,
    //required this.icon,
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
     
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.ksecondColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
            Image.asset(
              AppImageAsset.book,
              height: 68,
              width: 68,
            ),
            SizedBox(height: 10),
            Text(
              classModel.name!,
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
