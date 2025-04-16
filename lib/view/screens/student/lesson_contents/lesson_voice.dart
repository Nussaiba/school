





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/lesson_content/lesson_details_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/lessons_contents/voice_card.dart';


class LessonVoice extends StatelessWidget {
  const LessonVoice({super.key});

  @override
  Widget build(BuildContext context) {
       final LessonDetailsController controller = Get.find();

    return GetBuilder<LessonDetailsController>(
                builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
          padding: const EdgeInsets.fromLTRB(16.0 , 30, 16.0 , 0),
          child:
          controller.lessonDetailListAudio.isNotEmpty?
           GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 1.2,
            ),
            itemCount: controller.lessonDetailListAudio.length,
            itemBuilder: (context, index) {
              final file = controller.lessonDetailListAudio[index];
              return 
              // InkWell(
                  // onTap: () {
                  //     file.audioLink != null
                  //             ? controller.launchURL(file.audioLink!)
                  //             : controller.launchFile(file.audioFile!);
                  // },

                  GestureDetector(
                      onTap: () {
                        if (file.audioLink != null) {
                          controller.launchURL(file.audioLink!);
                        } else {
                         controller.launchURL(
                              "${AppLink.serverimage}/${file.audioFile!}");
                        }
                      },
                child: VoiceWidget(file: file));
            },
          ):
           buildTabContent(
                       icon:  Icons.assignment_turned_in,message:  'لا توجد ملفات صوتية بعد.'),
        ),
      ),
    );
  }
}
