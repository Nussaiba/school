import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/chat/get_teacher_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/view/widgets/messages_widgets/contact_card.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
        Get.put(GetTeacherController());
    return Scaffold(
        appBar: AppBar(
          title: Text('الرسائل'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: AppColor.kOtherColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
                topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
              )),
          clipBehavior: Clip.antiAlias,
          child:GetBuilder<GetTeacherController>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  itemCount: controller.teachersList.length,
                  itemBuilder: (context, index) {
                    final teacher = controller.teachersList[index];
                    return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.chatScreen, arguments: {"teacher": teacher});
                        },
                        child: ContactCard(teacher: teacher));
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
