import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';

import 'package:school/data/data_source/remote/teacher/chat/students_data.dart';
import 'package:school/data/model/teacher/chat/student_model.dart';

class GetStudentsController extends GetxController {
  TeacherChatData data = TeacherChatData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  List dataTeachers = [];
  List<Student> teachersList = [];
  late String teacherId;

  getStudents() async {
    dataTeachers.clear();
    teachersList.clear();
    statusRequest = StatusRequest.loading;
    var response = await data.getAllStudentsData(teacherId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataTeachers.length}lllllllmmmmmmmmmmlllll");
      dataTeachers.addAll(response['student']);
    
      for (int i = 0; i < dataTeachers.length; i++) {
        teachersList.add(
          Student.fromJson(dataTeachers[i]),
        );
      }
      update();
    
    }
  }

  @override
  void onInit() {
    teacherId = myServices.box.read("teacher_id");

    getStudents();
    super.onInit();
  }
}
