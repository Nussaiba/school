import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/data/model/Item_model.dart';

class HomeGridItem extends StatelessWidget {
  final ItemModel itemModel;
  final int? i;
  const HomeGridItem({required this.itemModel, this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          i == 0
              ? Get.toNamed(AppRoute.subjectsScreen)
              
                  : i == 1
                      ?
                      Get.toNamed(AppRoute.schedulePage) 
                      : i == 2
                          ? 
                          
                          Get.toNamed(AppRoute.messagesScreen)
                          : i == 3
                              ?                                   Get.toNamed(AppRoute.examScreen)

                              : i == 4
                                  ? 
                                   Get.toNamed(AppRoute.quiz)
                                  : i == 5
                                      ? 
                                      Get.toNamed(AppRoute.result)
                                     
                                      : i == 6
                                          ? Get.toNamed(AppRoute.medals)
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
