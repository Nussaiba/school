import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/lesson_contents/add/add_audio_controller.dart';
import 'package:school/controller/teacher/lesson_contents/lesson_details_teacher_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/lessons_contents/voice_card.dart';

class TeacherLessonVoice extends StatelessWidget {
  const TeacherLessonVoice({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonDetailsTeacherController controller = Get.find();
    AddAudioDetailsTeacherController addAudioDetailsTeacherController =
        Get.put(AddAudioDetailsTeacherController());
    return Scaffold(
        backgroundColor: AppColor.kOtherColor,
        body:GetBuilder<AddAudioDetailsTeacherController>(
                builder: (con) => HandlingDataRequest(
                  statusRequest: con.statusRequest,
                  widget: GetBuilder<LessonDetailsTeacherController>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30, 16.0, 0),
                  child: controller.lessonDetailListAudio.isNotEmpty
                      ? GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0,
                                childAspectRatio: 1.2,
                              ),
                              itemCount: controller.lessonDetailListAudio.length,
                              itemBuilder: (context, index) {
                                final file = controller.lessonDetailListAudio[index];
                                return GestureDetector(
                                     onTap: () {
                              file.audioLink != null
                                      ? controller.launchURL(file.audioLink!)
                                      : controller.launchFile(file.audioFile!);
                          },
                                  child: VoiceWidget(file: file));
                              },
                            )
                        
                      : buildTabContent(
                          icon: Icons.assignment_turned_in,
                          message: 'لا توجد ملفات صوتية بعد.'),
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
            addAudioDetailsTeacherController.showAudioUploadDialog();
          },
          child: Icon(Icons.add),
        ));
  }
}
