import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/chat/admin_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/view/widgets/chat_widget/bubble.dart';

class AdminChatScreen extends StatelessWidget {

  final AdminController chatController =
      Get.put(AdminController());

  AdminChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Row(
            children: [
              
              Text("الأدمن",
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
              GetBuilder<AdminController>(builder: (controller) {
          
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    controller: chatController.scrollController,
                    itemCount: chatController.messagesList.length,
                    itemBuilder: (context, index) {
                      final message = chatController.messagesList[index];
                      if (index == 0) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                                message.createdAt.toString().substring(0, 10),
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
                                    message.to == 1),
                          ],
                        );
                      } else {
                        if (message.createdAt.toString().substring(0, 10) !=
                            chatController.messagesList[index - 1].createdAt
                                .toString()
                                .substring(0, 10)) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                  message.createdAt.toString().substring(0, 10),
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
                                   message.to == 1),
                            ],
                          );
                        } else {
                          return Bubble(
                              message: message,
                              isUserMessage: message.to == 1);
                        }
                      }
                    },
                  )),
                 Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.kTextLightColor,
                    fontSize: 16.0,
                  ),
              controller: controller.messageController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(9),
                hintText: "أكتب رسالة...",
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.kTextLightColor,
                      fontSize: 16.0,
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColor.kTextLightColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(color: AppColor.kpraimaryColor, width: 2),
                ),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(color: AppColor.kTextLightColor, width: 2),
                ), 
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            maxRadius: 24,
            minRadius: 24,
            backgroundColor:  AppColor.kpraimaryColor,
            child: IconButton(
              icon: Icon(Icons.send, color: AppColor.kTextWhiteColor),
              onPressed: () {
                if (controller.messageController.text.isNotEmpty) {
                  chatController.sendMessage();
                  controller.messageController.clear();
                }
              },
            ),
          ),
        ],
      ),
    ),
                ],
              ),
            );
          }),
        )
    );
  }
}




