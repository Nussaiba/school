import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/chat/students_data.dart';
import 'package:school/data/model/student/chat/message_model.dart';

class AdminController extends GetxController {
  TeacherChatData data = TeacherChatData(Get.find());
  late TextEditingController messageController;

  late StatusRequest statusRequest = StatusRequest.none;
  late ScrollController scrollController;
  MyServices myServices = Get.find();
  List dataMessages = [];
  List<Message> messagesList = [];
  late String teacherId;

  getMessages() async {
    dataMessages.clear();
    messagesList.clear();
    statusRequest = StatusRequest.loading;
    var response = await data.getAllAdminMessages(teacherId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataMessages.length}lllllllmmmmmmmmmmlllll");
      dataMessages.addAll(response["chats"]);

      for (int i = 0; i < dataMessages.length; i++) {
        messagesList.add(
          Message.fromJson(dataMessages[i]),
        );
      }

      update();
    }
  }

  sendMessage() async {
    statusRequest = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    var response = await data.sendAdminMessagePost(
        teacherId.toString(), messageController.text);

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      print("yessssssssssss");
      await getMessages();

      update();
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController();

    teacherId = myServices.box.read("teacher_id");
    messageController = TextEditingController();
    getMessages();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
