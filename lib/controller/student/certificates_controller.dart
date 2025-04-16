import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/certificate.dart';

import '../../data/model/lessons_model.dart';


class CertificatesController extends GetxController {


  CertificateData certificateData = CertificateData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List dataCertificates = [];
  List<Lesson> certificatesList = [];
  late String  roomId ;
  late String   studentId ;

  getCertificates() async {
    dataCertificates.clear();
    certificatesList.clear();
    statusRequest = StatusRequest.loading;
    var response = await certificateData.getAllCertificatesData(studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataCertificates.length}lllllllmmmmmmmmmmlllll");
      dataCertificates.addAll(response['certificate']);
     
      // for (int i = 0; i < dataCertificates.length; i++) {
      //   certificatesList.add(
      //     Lesson.fromJson(dataCertificates[i]),
      //   );
      // }
      update();
    
    }
  }

  @override
  void onInit() {
        roomId = myServices.box.read("room_id");
    studentId = myServices.box.read("student_id");


    getCertificates();
    super.onInit();
  }
}
