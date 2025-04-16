import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:school/controller/teacher/lesson_contents/lesson_details_teacher_controller.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/lesson_detail/lesson_details_teacher.dart';
import 'package:school/data/model/lessons_model.dart';
import 'package:path/path.dart' as path;

class AddVideoDetailsTeacherController extends GetxController {
  LessonDetailsTeacherData lessonsData = LessonDetailsTeacherData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  late String teacherId;
  late String roomId;

  MyServices myServices = Get.find();

  late Lesson lesson;

  late TextEditingController fileNameController;
  late TextEditingController urlController;

  void showVideoUploadDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('إضافة فيديو جديد',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: AppColor.kTextBlackColor)),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18.0, color: AppColor.kTextBlackColor),
                  controller: fileNameController,
                  decoration: InputDecoration(
                    labelText: 'اسم فيديو',
                    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.0, color: AppColor.kTextLightColor),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18.0, color: AppColor.kTextBlackColor),
                  controller: urlController,
                  decoration: InputDecoration(
                    labelText: 'رابط الفيديو (اختياري)',
                    border: OutlineInputBorder(),
                    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.0, color: AppColor.kTextLightColor),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    pickFileData();
                  },
                  child: Text('اختيار ملف من الجهاز'),
                ),
                GetBuilder<AddVideoDetailsTeacherController>(
                  builder: (controller) => controller.selectedFile != null
                      ? Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () async {
                                await OpenFile.open(selectedFile!.path);
                              },
                              child: Text("عرض  الملف",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                          color: AppColor.kpraimaryColor)),
                            ),
                          ],
                        )
                      : Container(),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                print(urlController.text.isEmpty);
                if (fileNameController.text.isNotEmpty) {
                  if (selectedFile.isNull && urlController.text.isEmpty) {
                    Get.snackbar('خطأ', 'يرجى اختيار الملف');
                  } else {
                    upload();
                    Navigator.of(context).pop();
                  }
                } else {
                  Get.snackbar('خطأ', 'يرجى إدخال اسم الملف');
                }
              },
              child: Text('تأكيد'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء'),
            ),
          ],
        );
      },
    );
  }

  File? selectedFile;
  String? fileExtension;
  Future pickFileData() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      String selectedFilePath = result.files.single.path!;
      selectedFile = File(selectedFilePath);
      fileExtension = path.extension(selectedFile!.path);
      file.add(File(result.files.single.path!));

      update();
    } else {
      print("no file");
    }
  }

  var file = <File>[];
  var basefile = <String>[];

  upload() async {
    statusRequest = StatusRequest.loading;
    update();
    print("11111111111111111111111111  Controller");
    for (int i = 0; i < file.length; i++) {
      print(i);
      List<int> fileBytes = [];

      print("before send");
      fileBytes = file[i].readAsBytesSync();
      print(base64Encode(fileBytes));

      basefile.add(base64Encode(fileBytes));
      print(base64Encode(fileBytes));
    }

    var response = await lessonsData.addLessonDetailsData(
        '0',
        fileNameController.text,
        urlController.text,
        lesson.classId.toString(),
        lesson.roomId.toString(),
        lesson.lessonId.toString(),
        lesson.id.toString(),
        teacherId.toString(),
        selectedFile != null ? basefile.toString() : "",
        selectedFile != null ? fileExtension : "",
        selectedFile != null ? fileExtension : "",
        "",
        "");

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      print("yesssssssssssssssssssssssssssssssssssssssssssss");
      Get.snackbar('نجاح', 'تم إضافة الملف: ${fileNameController.text}');
      // Get.offAllNamed(AppRoute.teacherHome);
      LessonDetailsTeacherController con = Get.find();
      con.getLessonDetailVideo();
      update();
    }
    fileNameController.clear();
    file = <File>[];
    basefile = <String>[];
    fileExtension = null;
    selectedFile != null ? selectedFile!.delete() : () {};
    selectedFile = null;
    fileExtension = null;
    update();
  }

  @override
  void onInit() {
    fileNameController = TextEditingController();
    urlController = TextEditingController();
    roomId = Get.arguments["room_id"];
    teacherId = myServices.box.read("teacher_id");
    lesson = Get.arguments['lesson'];

    super.onInit();
  }
}
