import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/chat/teachers.dart';
import 'package:school/data/model/student/chat/teacher_model.dart';

class GetTeacherController extends GetxController {
  GetTeachersData data = GetTeachersData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  List dataTeachers = [];
  List<UserModel> teachersList = [];
  late String studentId;

  getTeachers() async {
    dataTeachers.clear();
    teachersList.clear();
    statusRequest = StatusRequest.loading;
    var response = await data.getAllTeachersData(studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataTeachers.length}lllllllmmmmmmmmmmlllll");
      dataTeachers.addAll(response['teachers']);

      for (int i = 0; i < dataTeachers.length; i++) {
        teachersList.add(
          UserModel.fromJson(dataTeachers[i]),
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    studentId = myServices.box.read("student_id");

    getTeachers();
    super.onInit();
  }
}
