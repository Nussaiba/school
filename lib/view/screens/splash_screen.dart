

import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/services/services.dart';
import 'package:school/core/constants/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return FlutterSplashScreen.scale(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColor.kpraimaryColor,
          AppColor.kpraimaryColor.withOpacity(0.6),
        ],
      ),
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "المدرسة",
            style: TextStyle(
              color: AppColor.kTextWhiteColor,
              fontSize: 26,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            " السورية الذكية ",
            style: TextStyle(
              color: AppColor.kTextWhiteColor,
              fontSize: 32,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: Image.asset(AppImageAsset.logo),
          ),
          const SizedBox(height: 20),
        ],
      ) ,
      animationDuration: const Duration(milliseconds: 3000),
      nextScreen: _getNextScreen(myServices),
    );
  }

  _getNextScreen(MyServices myServices) {
    Future.delayed(const Duration(milliseconds: 4000), () {
      print(myServices.box.read("account"));
      print(myServices.box.read("step"));
      if (myServices.box.read("step") == "1") {
        if (myServices.box.read("account") == "1") {
          Get.offAllNamed(AppRoute.teacherHome);
        } else {
          Get.offAllNamed(AppRoute.homeScreen);
        }
      } else {
        Get.offAllNamed(AppRoute.loginScreen);
      }
    });
  }
}
