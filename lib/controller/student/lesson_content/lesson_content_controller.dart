import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonContentController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  final List<String> tabs = [
    'ملف',
    'مقطع صوتي',
    'مقطع فيديو',
    'وظيفة',
    'اختبار',
  ];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
