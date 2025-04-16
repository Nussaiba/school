import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/subjects.dart';
import 'package:school/data/model/model2.dart';

class TeacherSubjectsController extends GetxController {
  TeacherSubjectsData subjectsData = TeacherSubjectsData(Get.find());

  late StatusRequest statusRequestSubjects = StatusRequest.none;

  MyServices myServices = Get.find();
  List dataSubjects = [];
  List<SubjectsModel> subjectsList = [];

  late String roomId;
  late String teacherId;

  getSubjects() async {
    dataSubjects.clear();
    subjectsList.clear();
    statusRequestSubjects = StatusRequest.loading;
    var response = await subjectsData.getAllSubjectsData(roomId, teacherId);
    print("================$response  Controller");
    statusRequestSubjects = handlingData(response);
    if (StatusRequest.success == statusRequestSubjects) {
      print("${dataSubjects.length}lllllllmmmmmmmmmmlllll");
      dataSubjects.addAll(response['subjects']);
      for (int i = 0; i < dataSubjects.length; i++) {
        subjectsList.add(
          SubjectsModel.fromJson(dataSubjects[i]),
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    roomId = Get.arguments["room_id"];
    teacherId = myServices.box.read("teacher_id");
    getSubjects();
    super.onInit();
  }
}
