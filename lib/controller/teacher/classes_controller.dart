import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/classes.dart';
import 'package:school/data/model/teacher/class_model.dart';

class ClassController extends GetxController {
  ClassesData classesData = ClassesData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List dataClasses = [];
  List<ClassModel> classesList = [];
  late String teacherId;
  getClasses() async {
    dataClasses.clear();
    classesList.clear();
    statusRequest = StatusRequest.loading;
    var response = await classesData.getAllClasseData(teacherId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataClasses.length}lllllllmmmmmmmmmmlllll");
      dataClasses.addAll(response['classes']);

      for (int i = 0; i < dataClasses.length; i++) {
        classesList.add(
          ClassModel.fromJson(dataClasses[i]),
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    
    teacherId = myServices.box.read("teacher_id");

    super.onInit();
    getClasses();
  }
}
