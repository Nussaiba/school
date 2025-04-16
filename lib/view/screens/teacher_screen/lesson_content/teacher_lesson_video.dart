import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/lesson_contents/add/add_video_controller.dart';
import 'package:school/controller/teacher/lesson_contents/lesson_details_teacher_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/lessons_contents/video_card.dart';

class TeacherLessonVideo extends StatelessWidget {
  const TeacherLessonVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonDetailsTeacherController controller = Get.find();
 AddVideoDetailsTeacherController addDetailsTeacherController =
        Get.put(AddVideoDetailsTeacherController());
    return Scaffold(
        backgroundColor: AppColor.kOtherColor,
        body:GetBuilder<AddVideoDetailsTeacherController>(
                builder: (con) => HandlingDataRequest(
                  statusRequest: con.statusRequest,
                  widget: GetBuilder<LessonDetailsTeacherController>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30, 16.0, 0),
                  child: controller.lessonDetailListVideo.isNotEmpty
                      ? 
                       GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                                childAspectRatio: 0.75,
                              ),
                              itemCount: controller.lessonDetailListVideo.length,
                              itemBuilder: (context, index) {
                                final file = controller.lessonDetailListVideo[index];
                                return GestureDetector(
                                  onTap: (){
                                      file.videoLink != null
                                      ? controller.launchURL(file.videoLink!)
                                      : controller.launchFile(file.video!);
                                  },
                                  child: VideoWidget(file: file));
                              },
                            )
                        
                      : buildTabContent(
                          icon: Icons.assignment_turned_in,
                          message: 'لا توجد فيديوهات بعد.'),
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
           addDetailsTeacherController.showVideoUploadDialog();
          },
          child: Icon(Icons.add),
        ));
  }
}