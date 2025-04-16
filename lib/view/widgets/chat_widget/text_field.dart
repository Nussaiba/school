import 'package:flutter/material.dart';
import 'package:school/controller/student/chat/get_message_controller.dart';
import 'package:school/core/constants/app_color.dart';

class TextFieldMessage extends StatelessWidget {
  const TextFieldMessage({
    super.key,
    required this.messageController,
    required this.chatController,
  });

  final TextEditingController messageController;
  final GetMessageController chatController;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              controller: messageController,
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
              icon: Padding(
                padding: const EdgeInsets.only( right: 1.0),
                child: Icon(Icons.send, color: AppColor.kTextWhiteColor),
              ),
              onPressed: () {
                if (messageController.text.isNotEmpty) {
                  chatController.sendMessage();
                  messageController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
