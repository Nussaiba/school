import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/schedule.dart';
import 'package:school/data/model/schedule_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleController extends GetxController {
  ScheduleData data = ScheduleData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  late StatusRequest statusRequest2 = StatusRequest.none;
  late StatusRequest statusRequest3 = StatusRequest.none;

  MyServices myServices = Get.find();
  late String studentId;
  late String roomId;

  List dataSchedule = [];
  List<Day> days = [];
  getSchedule() async {
    dataSchedule.clear();
    days.clear();
    statusRequest = StatusRequest.loading;

    update();
    var response = await data.getScheduleData(roomId, studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataSchedule.length}lllllllmmmmmmmmmmlllll");

      response['schedule'].forEach((dayJson) {
        days.add(Day.fromJson(dayJson));
      });

      update();
    }
  }

  List dataTimes = [];
  List<LectureTime> timesList = [];

  getTimes() async {
    dataTimes.clear();
    timesList.clear();
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await data.getScheduleData(roomId, studentId);
    print("================$response  Controller");
    statusRequest2 = handlingData(response);
    if (StatusRequest.success == statusRequest2) {
      print("${dataSchedule.length}lllllllmmmmmmmmmmlllll");
      dataTimes.addAll(response['lecture_times']);

      for (int i = 0; i < dataTimes.length; i++) {
        timesList.add(
          LectureTime.fromJson(dataTimes[i]),
        );
      }

      print(timesList.length);
    }
    update();
  }

  List dataweekDays = [];
  List<Weekday> weekDaysList = [];

  getDays() async {
    dataweekDays.clear();
    weekDaysList.clear();
    statusRequest3 = StatusRequest.loading;
    update();
    var response = await data.getScheduleData(roomId, studentId);
    print("================$response  Controller");
    statusRequest3 = handlingData(response);
    if (StatusRequest.success == statusRequest3) {
      print("${dataweekDays.length}lllllllmmmmmmmmmmlllll");

      dataweekDays.addAll(response['days']);
      print(response['days']);

      for (int i = 0; i < dataweekDays.length; i++) {
        weekDaysList.add(
          Weekday.fromJson(dataweekDays[i]),
        );
      }
      print(weekDaysList);
    }
    update();
  }

  String getDayNameById(int id) {
    try {
      return weekDaysList.firstWhere((day) => day.id == id).name;
    } catch (e) {
      return "اليوم غير موجود"; 
    }
  }

  @override
  void onInit() {
    roomId = myServices.box.read("room_id");
    studentId = myServices.box.read("student_id");

    getDays();

    getTimes();

    getSchedule();

    print(dataweekDays);

    super.onInit();
  }

  void launchURL(String url) async {

    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
   
  }

  setAttendanceStudent(
    schedulerId,
    dayId,
    lectureTimeId,
  ) async {
    var response = await data.setAttendanceStudentData(
        schedulerId, dayId, lectureTimeId, roomId, studentId);
    print(response);
  }
}
