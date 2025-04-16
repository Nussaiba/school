import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/lesson_contents/add/add_lesson_details_controller.dart';
import 'package:school/controller/teacher/lesson_contents/lesson_details_teacher_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/lessons_contents/pdf_card.dart'; // Add file_picker package

class TeacherLessonFiles extends StatelessWidget {
  const TeacherLessonFiles({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonDetailsTeacherController controller = Get.find();
    AddLessonDetailsTeacherController addLessonDetailsTeacherController =
        Get.put(AddLessonDetailsTeacherController());
    return Scaffold(
        backgroundColor: AppColor.kOtherColor,
        body: GetBuilder<AddLessonDetailsTeacherController>(
                builder: (con) => HandlingDataRequest(
                  statusRequest: con.statusRequest,
                  widget:  GetBuilder<LessonDetailsTeacherController>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30, 16.0, 0),
                  child: controller.dataLessonDetail.isNotEmpty
                      ?  
                      GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                                childAspectRatio: 1.2,
                              ),
                              itemCount: controller.lessonDetailList.length,
                              itemBuilder: (context, index) {
                                final file = controller.lessonDetailList[index];
                                return GestureDetector(
                                    onTap: () {
                                      print( file.additionLink != null);
                                      file.additionLink != null
                                          ? controller.launchURL(file.additionLink!)
                                          : controller.launchFile(file.addition!);
                                    },
                                    child: FileWidget(file: file));
                              },
                            )
                      
                      : buildTabContent(
                          icon: Icons.assignment_turned_in,
                          message: 'لا توجد ملفات بعد.'),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: AppColor.kpraimaryColor,
          hoverColor: AppColor.kpraimaryColor,
          foregroundColor: AppColor.kpraimaryColor,
          backgroundColor: AppColor.ksecondColor,
          onPressed: () {
            addLessonDetailsTeacherController.showFileUploadDialog();
            // _showFileUploadDialog();
          },
          child: Icon(Icons.add),
        ));
  }

  void _showFileUploadDialog() {
    final TextEditingController fileNameController = TextEditingController();
    String? filePath;
    String? fileUrl;

    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('إضافة ملف جديد',
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
                    labelText: 'اسم الملف',
                    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.0, color: AppColor.kTextLightColor),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    fileUrl = value;
                  },
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18.0, color: AppColor.kTextBlackColor),
                  decoration: InputDecoration(
                    labelText: 'رابط الملف (اختياري)',
                    border: OutlineInputBorder(),
                    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.0, color: AppColor.kTextLightColor),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    // String? filePath = await FilePicker.platform
                    //     .pickFiles()
                    //     .then((value) => value?.files.first.path);
                    // if (filePath != null) {
                    //   fileNameController.text =
                    //       filePath.split('/').last; // Extract file name
                    // }
                  },
                  child: Text('اختيار ملف من الجهاز'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String fileName = fileNameController.text;
                if (fileName.isNotEmpty) {
                  // هنا يمكنك إضافة الكود لحفظ الملف
                  Get.snackbar('نجاح', 'تم إضافة الملف: $fileName');
                  Navigator.of(context).pop(); // إغلاق الحوار
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
}
