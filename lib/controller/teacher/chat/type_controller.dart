import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/chat/get_student_controller.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/chat/students_data.dart';
import 'package:school/data/data_source/remote/teacher/classes.dart';
import 'package:school/data/data_source/remote/teacher/rooms.dart';
import 'package:school/data/model/teacher/chat/All_student_model.dart';
import 'package:school/data/model/teacher/class_model.dart';
import 'package:school/data/model/teacher/room_model.dart';

class GetTypeInfoController extends GetxController {
  late String teacherId;

  var selectedClass = ''.obs;
  var selectedSection = ''.obs;
  var selectedStudent = ''.obs;

  int? selectedRoomId;
  int? selectedStudentId;

  var message = ''.obs;
  late TextEditingController textEditingController;

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

//students
  TeacherChatData data = TeacherChatData(Get.find());
  List dataTeachers = [];
  List<StudentModel> studentsList = [];
  getAllStudents(String roomId) async {
    dataTeachers.clear();
    studentsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await data.getAllStudents(roomId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataTeachers.length}lllllllmmmmmmmmmmlllll");
      dataTeachers.addAll(response['room_students']);
   
      for (int i = 0; i < dataTeachers.length; i++) {
        studentsList.add(
          StudentModel.fromJson(dataTeachers[i]),
        );
      }
      update();
    }
  }
//classes

  ClassesData classesData = ClassesData(Get.find());

  List dataClasses = [];
  List<ClassModel> classesList = [];

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

//////rooms

  RoomsData roomsData = RoomsData(Get.find());
  List dataRooms = [];
  List<RoomModel> roomsList = [];

  getRooms(String classId) async {
    dataRooms.clear();
    roomsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await roomsData.getAllRoomsData(classId, teacherId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataRooms.length}lllllllmmmmmmmmmmlllll");
      dataRooms.addAll(response['rooms']);

      for (int i = 0; i < dataRooms.length; i++) {
        roomsList.add(
          RoomModel.fromJson(dataRooms[i]),
        );
      }
      update();
    }
  }

///////
  selectClass(selectedClassName) async {
    selectedClass.value = selectedClassName!;
    selectedSection.value = '';
    update();

    String? classId = classesList
        .firstWhere(
          (classModel) => classModel.name == selectedClassName,
        )
        .id
        .toString();

    if (classId.isNotEmpty) {
      await getRooms(classId);
    }
  }

//////////
  selectRoom(selectedRoomName) async {
    selectedSection.value = selectedRoomName;
    update();
    int? roomId = roomsList
        .firstWhere(
          (room) => room.name == selectedRoomName,
        )
        .id;
    selectedRoomId = roomId;
    if (roomId.toString().isNotEmpty) {
      await getAllStudents(roomId.toString());
    }
  }
//////////////

  selectStudent(selectedStudentName) {
    selectedStudent.value = selectedStudentName;
    selectedStudentId = studentsList
        .firstWhere(
          (student) => student.firstName == selectedStudentName,
        )
        .id;
    update();
  }

//send single message
  TeacherChatData dataSend = TeacherChatData(Get.find());
  late StatusRequest statusRequestSend = StatusRequest.none;

  sendSingleMessage() async {
    statusRequestSend = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    var response = await data.sendMessagePost(selectedStudentId.toString(),
        teacherId.toString(), textEditingController.text);

    print("================$response  Controller");
    statusRequestSend = handlingData(response);
    print(statusRequestSend);
    if (StatusRequest.success == statusRequestSend) {
      print("yessssssssssss");
   
      GetStudentsController con = Get.put(GetStudentsController());
      await con.getStudents();
      Get.offAllNamed(AppRoute.teacherHome);
      Get.snackbar('', 'تم الإرسال بنجاح');
      update();
    }
  }

  sendGroupMessage() async {
    statusRequestSend = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    var response = await data.sendGroupMessagePost(selectedRoomId.toString(),
        teacherId.toString(), textEditingController.text);

    print("================$response  Controller");
    statusRequestSend = handlingData(response);
    print(statusRequestSend);
    if (StatusRequest.success == statusRequestSend) {
      print("yessssssssssss");
      // GetMessagesTeacherController c = Get.find();
      // await c.getMessages();
      GetStudentsController con = Get.put(GetStudentsController());
      await con.getStudents();
      Get.offAllNamed(AppRoute.teacherHome);
      Get.snackbar('', 'تم الإرسال بنجاح للشعبة ${selectedSection.value}');
      update();
    }
  }

  @override
  void onInit() {
    teacherId = myServices.box.read("teacher_id");
    getClasses();

    textEditingController = TextEditingController();
    super.onInit();
  }
}
