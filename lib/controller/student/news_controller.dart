import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_image.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List datanews = [
    AppImageAsset.school_logo,
    AppImageAsset.logo,
    AppImageAsset.background,
  ];

  late PageController pageController;
  int currentPage = 0;
  late Duration _duration;
  late Curve _curve;
  void startAutoScroll() {
    Future.delayed(_duration, () {
      if (pageController.page!.toInt() == datanews.length - 1) {
        pageController.jumpToPage(0);
      } else {
        pageController.nextPage(duration: _duration, curve: _curve);
        startAutoScroll();
      }
      update();
    });
  }

  onPageChanged(int indexpage) {
    currentPage = indexpage;
    update();
  }

  int currentImage = 0;
  onPageImageChanged(int indexpage) {
    currentImage = indexpage;
    update();
  }

  late TabController tabController;

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    pageController.dispose();
  }

  @override
  void onInit() {
    pageController = PageController();
    tabController = TabController(length: 5, vsync: this);
    _duration = Duration(seconds: 2);
    _curve = Curves.fastEaseInToSlowEaseOut;
    Future.delayed(Duration.zero, () {
      datanews.isNotEmpty ? startAutoScroll() : () {};
    });
    super.onInit();
  }
}
