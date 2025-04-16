import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/subjects.dart';
import 'package:school/data/model/model2.dart';

class SubjectController extends GetxController {
  SubjectsData homeData = SubjectsData(Get.find());

  late StatusRequest statusRequestSubjects = StatusRequest.none;
  late String roomId;
  late String studentId;

  MyServices myServices = Get.find();
  List dataSubjects = [];
  List<SubjectsModel> subjectsList = [];

  getSubjects() async {
    dataSubjects.clear();
    subjectsList.clear();
    statusRequestSubjects = StatusRequest.loading;
    var response = await homeData.getAllSubjectsData(roomId, studentId);
    print("================$response  Controller");
    statusRequestSubjects = handlingData(response);
    if (StatusRequest.success == statusRequestSubjects) {
      print("${dataSubjects.length}lllllllmmmmmmmmmmlllll");
      dataSubjects.addAll(response['msg']['lessons2']);

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
    roomId = myServices.box.read("room_id");
    studentId = myServices.box.read("student_id");
    getSubjects();
    super.onInit();
  }
}
