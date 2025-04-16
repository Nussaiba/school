import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/model/Item_model.dart';

class HomeController extends GetxController {
  final List<ItemModel> items = [
    ItemModel(name: 'المواد', icon: Icons.book),
    ItemModel(name: 'جدول الدوام', icon: Icons.schedule),
    ItemModel(name: 'الرسائل', icon: Icons.message),
    ItemModel(name: 'الامتحانات', icon: Icons.assignment),
    ItemModel(name: 'المذاكرات', icon: Icons.assignment),
    ItemModel(name: 'الجلاء المدرسي', icon: Icons.school),
    ItemModel(name: 'الجوائز', icon: Icons.emoji_events),
  ];

  late StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  late String name;
  late String studentClass;
  late String room;

  @override
  void onInit() {
    name = myServices.box.read("name");
    studentClass = myServices.box.read("class");
    room = myServices.box.read("room");

    super.onInit();
  }

  void logout() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(Duration(seconds: 3), () {});
    await myServices.box.erase();
    Get.offAllNamed(AppRoute.loginScreen);
  }
}
