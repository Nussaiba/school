import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/medals.dart';
import 'package:school/data/model/medals_model.dart';

class MedalsController extends GetxController {
  MedalsData lessonsData = MedalsData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  late String studentId;
  MyServices myServices = Get.find();
  List dataMedals = [];
  List<MedalsModel> medalsList = [];

  getMedals() async {
    dataMedals.clear();
    medalsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getAllMedalsData(studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataMedals.length}lllllllmmmmmmmmmmlllll");
      dataMedals.addAll(response['medals']);

      for (int i = 0; i < dataMedals.length; i++) {
        medalsList.add(
          MedalsModel.fromJson(dataMedals[i]),
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    studentId = myServices.box.read("student_id");

    getMedals();
    super.onInit();
  }
}
