import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/login.dart';

class LoginController extends GetxController {
  late bool passwordVissible;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  String? accountType;

  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  void showPassword() {
    passwordVissible = !passwordVissible;
    update();
  }

  gologin() async {
    statusRequest = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    var response = await loginData.postdata(email.text, password.text);

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == '1') {
        print(response["status"]);
        accountType = "${response["msg"]["type"]}";
        myServices.box.write("account", "${response["msg"]["type"]}");
        if (accountType == '0') {
          myServices.box.write("room_id",
              "${response["msg"]["student"]["room"][0]["pivot"]["room_id"]}");
          myServices.box.write("student_id",
              "${response["msg"]["student"]["room"][0]["pivot"]["student_id"]}");
          myServices.box
              .write("name", "${response["msg"]["student"]["first_name"]}");
          myServices.box.write("class",
              "${response["msg"]["student"]["room"][0]["classes"]["name"]}");

          myServices.box.write(
              "room", "${response["msg"]["student"]["room"][0]["name"]}");

          print("${response["msg"]["student"]["room"][0]["pivot"]["room_id"]}");
          print(
              "${response["msg"]["student"]["room"][0]["pivot"]["student_id"]}");
        } else {
          myServices.box
              .write("teacher_id", "${response["msg"]["teacher"]["id"]}");
          myServices.box.write("name",
              "${response["msg"]["teacher"]["first_name"]}"+" "+"${response["msg"]["teacher"]["last_name"]}");
          print(
              "=========================================================${response["msg"]["teacher"]["id"]}==============================================");
        }

        myServices.box.write("step", "1");

        accountType == '0'
            ? Get.offNamed(AppRoute.homeScreen)
            : accountType == '1'
                ? Get.offNamed(AppRoute.teacherHome)
                : () {};
      }

      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    passwordVissible = true;
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
