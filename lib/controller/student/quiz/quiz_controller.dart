import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:school/api_link.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/quiz/quiz_data.dart';
import 'package:school/data/model/exams_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;

class QuizController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    roomId = myServices.box.read("room_id");
    studentId = myServices.box.read("student_id");
    getExams();
  }

  QuizData examsData = QuizData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List dataExams = [];
  List<ExamModel> examsList = [];
  late String roomId;
  late String studentId;

  getExams() async {
    print("========= Controller ===========");

    dataExams.clear();
    examsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await examsData.getAllQuizData(roomId, studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataExams.length}exaaaaam");
      dataExams.addAll(response['exams']);

      for (int i = 0; i < dataExams.length; i++) {
        examsList.add(
          ExamModel.fromJson(dataExams[i]),
        );
      }
      update();
    }
  }

  
  File? selectedFile;
  String? fileExtension;
  Future pickFileData() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      String selectedFilePath = result.files.single.path!;
      selectedFile = File(selectedFilePath);
      fileExtension = path.extension(selectedFile!.path);
      update();
    } else {
      print("no file");
    }
  }

  void downLoadExam(String url) async {
    await launchUrl(
      Uri.parse("${AppLink.serverimage}/$url"),
      mode: LaunchMode.externalApplication,
    );
  }

  upload(String examId) async {
    if (selectedFile != null) {
      print("{selectedFile != null}");
      statusRequest = StatusRequest.loading;
      update();
      print("11111111111111111111111111  Controller");

      var response = await examsData.sendExamFileData(
          studentId, examId, selectedFile!, fileExtension!);

      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        print("yessssssssssssssss");
        Get.back();

        Get.snackbar('نجاح', " تم رفع الملف بنجاح");
      }
    } else {
      Get.snackbar('تنبيه', "الرجاء احتيار ملف");
    }
    selectedFile!.delete();
    selectedFile = null;
    update();
  }

  Future<void> openSelectedFile() async {
    if (selectedFile != null) {
      final result = await OpenFile.open(selectedFile!.path);
      if (result.message != 'Success') {
        print('Error opening file: ${result.message}');
      }
    } else {
      print('No file selected');
    }
  }
}
