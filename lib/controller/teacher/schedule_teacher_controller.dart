import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/schedule.dart';
import 'package:school/data/model/teacher/schedule_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleTeacherController extends GetxController {
  ScheduleTeacherData data = ScheduleTeacherData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
late String  teacherId ;


  MyServices myServices = Get.find();
  List dataSchedule = [];
  List<DaySchedule> days = [];
  getSchedule() async {
    dataSchedule.clear();
    days.clear();
    statusRequest = StatusRequest.loading;

    update();
    var response = await data.getScheduleData(teacherId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == '1') {
      print("${dataSchedule.length}lllllllmmmmmmmmmmlllll");
    

      response['schedule'].forEach((dayJson) {
        days.add(DaySchedule.fromJson(dayJson));
      });

      update();
       }
      
    }
  }
String getDayName(int dayId) {
  List<String> daysOfWeek = [
    'السبت',
    'الأحد',
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];

  if (dayId < 1 || dayId > 7) {
    return 'معرف اليوم غير صالح';
  }

  return daysOfWeek[dayId - 1]; 
}
  void launchURL(String url) async {
    //if (await canLaunchUrl(Uri.parse(url))) {

    await launchUrl(
      Uri.parse(url),
                        mode: LaunchMode.externalApplication,

    );
    // } else {
    //   throw 'Could not launch $url';
    // }
  }


  @override
  void onInit() {
        teacherId = myServices.box.read("teacher_id");
    getSchedule();

    super.onInit();
  }
}
