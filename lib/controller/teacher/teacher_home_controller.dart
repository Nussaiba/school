import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/model/Item_model.dart';

class TeacherHomeController extends GetxController {
  final List<ItemModel> items = [
    ItemModel(name: 'الصفوف', icon: Icons.book),
    ItemModel(name: 'جدول الدوام', icon: Icons.schedule),
    ItemModel(name: 'الرسائل', icon: Icons.message),
  ];
  late StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  late String name;
  void logout() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(Duration(seconds: 3), () {});
    await myServices.box.erase();
    Get.offAllNamed(AppRoute.loginScreen);
  }
   @override
  void onInit() {
    name = myServices.box.read("name");
   
    super.onInit();
  }

}
