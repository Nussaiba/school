import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/lesson_content/lesson_details_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/view/widgets/lessons_contents/no_details.dart';
import 'package:school/view/widgets/lessons_contents/video_card.dart';
import 'package:school/view/widgets/lessons_contents/voice_card.dart';

class LessonVideo extends StatelessWidget {
  const LessonVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonDetailsController controller = Get.find();

    return GetBuilder<LessonDetailsController>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 30, 16.0, 0),
          child: controller.lessonDetailListVideo.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: controller.lessonDetailListVideo.length,
                  itemBuilder: (context, index) {
                    final file = controller.lessonDetailListVideo[index];
                    return
                    //  InkWell(
                        // onTap: () {
                        //   file.videoLink != null
                        //       ? controller.launchURL(file.videoLink!)
                        //       : controller.launchFile(file.video!);
                        // },
                         GestureDetector(
                      onTap: () {
                        if (file.videoLink != null) {
                          controller.launchURL(file.videoLink!);
                        } else {
                         controller.launchURL(
                              "${AppLink.serverimage}/${file.video!}");
                        }
                      },
                        child: VideoWidget(file: file));
                  },
                )
              : buildTabContent(
                  icon: Icons.assignment_turned_in,
                  message: 'لا توجد فيديوهات بعد.'),
        ),
      ),
    );
  }
}
