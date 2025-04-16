import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/graduate.dart';
import 'package:url_launcher/url_launcher.dart';

class GraduateController extends GetxController {
  GraduateData graduateData = GraduateData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  late String studentId;
  late String roomId;
  int? status;
  String? link;

  MyServices myServices = Get.find();
  String? message;
  getGraduate() async {
    statusRequest = StatusRequest.loading;
    var response = await graduateData.getAllGraduateData(studentId, roomId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      status = response['status'];
      message = response['message'].toString();
      link = response['link'].toString();
    }
    update();
  }

  // void launchURL() async {
  //   //if (await canLaunchUrl(Uri.parse(url))) {
  //   await launchUrl(
  //     Uri.parse(link!),
  //     mode: LaunchMode.externalApplication,
  //   );
  // }

  // void launchURL() async {
  //   print(link);
  //   final driveUrl = link!.replaceAll('/view?usp=sharing', '/preview');
  //   print(driveUrl);
  //   if (await canLaunch(driveUrl)) {
  //     await launch(driveUrl);
  //   } else {
  //     throw 'Could not launch $driveUrl';
  //   }
  // }

 void launchURL() async {
    final driveUrl = link!.replaceAll('/view?usp=sharing', '/preview');
    print(driveUrl);
    if (await canLaunch(driveUrl)) {
      await launch(driveUrl);
    } else {
      throw 'Could not launch $driveUrl';
    }
  }
//  void launchURL() async {
//     //if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(
//       Uri.parse(link!),
//       // mode: LaunchMode.externalApplication,
//     );
//     // } else {
//     //   throw 'Could not launch $url';
//     // }
//   }

  @override
  void onInit() {
    studentId = myServices.box.read("student_id");
    roomId = myServices.box.read("room_id");
    getGraduate();
    super.onInit();
  }
}
