import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/chat/students_data.dart';
import 'package:school/data/model/student/chat/message_model.dart';
import 'package:school/data/model/teacher/chat/student_model.dart';

class GetMessagesTeacherController extends GetxController {
  TeacherChatData data = TeacherChatData(Get.find());
  late TextEditingController messageController;

  late StatusRequest statusRequest = StatusRequest.none;
  late ScrollController scrollController;
  MyServices myServices = Get.find();
  List dataMessages = [];
  List<Message> messagesList = [];
  late String teacherId;
  
  late Student student;
  getMessages() async {
    dataMessages.clear();
    messagesList.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await data.getAllStudentsMessagesData(teacherId, student.id.toString());
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
        student.id.toString(), teacherId.toString(), messageController.text);

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      print("yessssssssssss");
      await getMessages();

      update();
    }
  }

  scroll() async {
    print("ScrollScrollScrollScrollScroll");
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

    teacherId = myServices.box.read("teacher_id");

    messageController = TextEditingController();
    student = Get.arguments['student'];
    getMessages();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
