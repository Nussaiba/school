import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/chat/get_message_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/view/widgets/chat_widget/bubble.dart';
import 'package:school/view/widgets/general/no_data.dart';
import 'package:school/view/widgets/teacher_widgets/chat/text_field_chat.dart';

class TeacherChatScreen extends StatelessWidget {
  final GetMessagesTeacherController chatController =
      Get.put(GetMessagesTeacherController());

  TeacherChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Row(
            children: [
              SizedBox(width: 10),
              Text(
                  "${chatController.student.firstName}  ${chatController.student.lastName}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      )),
              Spacer(),
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(AppImageAsset.logo),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey.shade400, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: DecorationImage(
              image: AssetImage(AppImageAsset.backgroundChat),
              fit: BoxFit.cover,
            ),
          ),
          child:
              GetBuilder<GetMessagesTeacherController>(builder: (controller) {
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  controller.messagesList.isEmpty
                      ? Expanded(
                          child: CustomNoData(
                          text: 'لا يوجد رسائل',
                        ))
                      : Expanded(
                          child: ListView.builder(
                          controller: chatController.scrollController,
                          itemCount: chatController.messagesList.length,
                          itemBuilder: (context, index) {
                            final message =
                                chatController.messagesList[index];
                            if (index == 0) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                      message.createdAt!
                                          .toString()
                                          .substring(0, 10),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: AppColor.kTextLightColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16.0,
                                          )),
                                  Bubble(
                                      message: message,
                                      isUserMessage:
                                          message.type.toString() == '0'),
                                ],
                              );
                            } else {
                              if (message.createdAt!
                                      .toString()
                                      .substring(0, 10) !=
                                  chatController
                                      .messagesList[index - 1].createdAt!
                                      .toString()
                                      .substring(0, 10)) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                        message.createdAt!
                                            .toString()
                                            .substring(0, 10),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColor.kTextLightColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16.0,
                                            )),
                                    Bubble(
                                        message: message,
                                        isUserMessage:
                                            message.type.toString() == '0'),
                                  ],
                                );
                              } else {
                                return Bubble(
                                    message: message,
                                    isUserMessage:
                                        message.type.toString() == '0');
                              }
                            }
                          },
                        )),
                  TextFieldTeacherMessage(
                      messageController: chatController.messageController,
                      chatController: chatController),
                ],
              ),
            );
          }),
        ));
  }
}
