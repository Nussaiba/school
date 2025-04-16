import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/lessons.dart';

import '../../data/model/lessons_model.dart';

class LessonsController extends GetxController {
  LessonsData lessonsData = LessonsData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  late int subjectsId;
  MyServices myServices = Get.find();
  List dataLessons = [];
  List<Lesson> lessonsList = [];
 late String  roomId ;
  late String   studentId ;

  
  getLessons(subjectsId) async {
    dataLessons.clear();
    lessonsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getAllLessonsData(subjectsId, roomId, studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataLessons.length}lllllllmmmmmmmmmmlllll");
      dataLessons.addAll(response['msg']);
    
      for (int i = 0; i < dataLessons.length; i++) {
        lessonsList.add(
          Lesson.fromJson(dataLessons[i]),
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    subjectsId = Get.arguments['subjectsId'];
   roomId = myServices.box.read("room_id");
    studentId = myServices.box.read("student_id");


    getLessons(subjectsId);
    super.onInit();
  }
}
