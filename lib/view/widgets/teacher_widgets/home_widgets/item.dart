import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/data/model/Item_model.dart';

class HomeItem extends StatelessWidget {
  final ItemModel itemModel;
  final int? i;
  const HomeItem({required this.itemModel, this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
                i == 0
            ? Get.toNamed(AppRoute.classesScreen)
               : i == 1
                    ? Get.toNamed(AppRoute.scheduleTeacherPage)
                : i == 2
                    ? Get.toNamed(AppRoute.teacherChats)
                   
                        : () {};
        },
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
              Icon(
                itemModel.icon,
                size: 50,
                color: AppColor.ksecondColor,
              ),
              SizedBox(height: 10),
              Text(
               itemModel.name!,
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
      ),
    );
  }
}
