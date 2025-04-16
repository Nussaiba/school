import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/chat/teachers.dart';
import 'package:school/data/model/student/chat/message_model.dart';
import 'package:school/data/model/student/chat/teacher_model.dart';

class GetMessageController extends GetxController {
  GetTeachersData data = GetTeachersData(Get.find());
  late TextEditingController messageController;

  late StatusRequest statusRequest = StatusRequest.none;
  late ScrollController scrollController;
  MyServices myServices = Get.find();
  List dataMessages = [];
  List<Message> messagesList = [];
  late String studentId;
  // late String teacherId;
  // late String userType;
  late UserModel teacher;
  getMessages() async {
    dataMessages.clear();
    messagesList.clear();
    statusRequest = StatusRequest.loading;
    var response = await data.getAllTeachersMessagesData(
        studentId, teacher.id.toString(), teacher.userType.toString());
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataMessages.length}lllllllmmmmmmmmmmlllll");
      dataMessages.addAll(response["message"]);

      for (int i = 0; i < dataMessages.length; i++) {
        messagesList.add(
          Message.fromJson(dataMessages[i]),
        );
      }
      scroll();

      update();
    }
  }

  sendMessage() async {
    statusRequest = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    var response = await data.sendMessagePost(
        studentId, teacher.id.toString(), messageController.text);

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      print("yessssssssssss");
      getMessages();
      // if (response["status"] == '1') {
    }
    update();
  }

  scroll() async {
    print("ScrollScrollScrollScrollScrollScrollScrollScrollScrollScroll");
    Future.delayed(Duration(seconds: 1), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        update();
      }
    });
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    studentId = myServices.box.read("student_id");

    messageController = TextEditingController();
    teacher = Get.arguments['teacher'];
    getMessages();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
