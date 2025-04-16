import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/lessons.dart';
import 'package:school/view/widgets/exams_widgets/exam_card.dart';
import '../../data/model/lessons_model.dart';

class TeacherLessonsController extends GetxController {
  TeacherLessonsData lessonsData = TeacherLessonsData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late int subjectsId;
  MyServices myServices = Get.find();
  List dataLessons = [];
  List<Lesson> lessonsList = [];
  late String roomId;
  late String teacherId;

  getLessons(subjectsId) async {
    dataLessons.clear();
    lessonsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getAllLessonsData(subjectsId, roomId,teacherId );
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

  addNewLesson() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await lessonsData.addNewLessonData(
        teacherId, roomId, subjectsId.toString(), name.text);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      await getLessons(subjectsId);
      Get.snackbar('نجاح', ' تم إضافة الدرس ${name.text}');

      update();
    }
    name.clear();
  }

  void showAddLessonDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            'إضافة درس جديد',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: AppColor.kTextBlackColor,
                ),
          )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18.0,
                      color: AppColor.kTextBlackColor,
                    ),
                decoration: InputDecoration(
                  hintText: 'اسم الدرس',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();

                    await addNewLesson();
                  },
                  child: CustomButton(title: 'حفظ')),
            ],
          ),
        );
      },
    );
  }

  @override
  void onInit() {
    name = TextEditingController();
    subjectsId = Get.arguments['subjectsId'];
    roomId = Get.arguments["room_id"];
    teacherId = myServices.box.read("teacher_id");

    getLessons(subjectsId);
    super.onInit();
  }
}
