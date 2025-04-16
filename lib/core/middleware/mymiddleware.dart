import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    print(myServices.box.read("account"));
    print(myServices.box.read("step"));

    Future.delayed(const Duration(seconds: 4), () {
      if (myServices.box.read("step") == "4") {
      
      } else {
         if (myServices.box.read("step") == "3") {
        //   // return const RouteSettings(name: AppRoute.mainScreens);
        //   Get.offAllNamed(AppRoute.login);
        } else {
          if (myServices.box.read("step") == "2") {
            // if (myServices.box.read("account") == "job_seeker") {
            //   Get.offAllNamed(AppRoute.createProfile);
            // } else {
            //   Get.offAllNamed(AppRoute.createcompanyProfile);
            // }
          } else {
            if (myServices.box.read("step") == "1") {
              if (myServices.box.read("account") == "1") {
              Get.offAllNamed(AppRoute.teacherHome);
            } else {
              Get.offAllNamed(AppRoute.homeScreen);
            }
            } else {
              Get.offAllNamed(AppRoute.loginScreen);
            }
          }
        }
      }
    });

    return null;
  }
}
