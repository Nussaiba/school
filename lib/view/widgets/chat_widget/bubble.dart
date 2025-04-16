import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/data/model/student/chat/message_model.dart';

class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    required this.message, required this.isUserMessage,
  });

  final Message message;
final bool isUserMessage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
         isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color:
          isUserMessage
              ?
               AppColor.ksecondColor
             : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: isUserMessage
                  ? Radius.circular(20)
                  : Radius.circular(0),
              bottomRight:isUserMessage
                  ? Radius.circular(0)
                  : Radius.circular(20)),
          border: Border.all(
            color: isUserMessage
                ? AppColor.kpraimaryColor.withOpacity(0.1)
                : Colors.grey.shade400,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:isUserMessage
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(message.message != null ?  message.message! : ' '  ,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color:
                         isUserMessage ? Colors.white : Colors.black,
                    )),
            SizedBox(height: 4),
            Text(
              message.createdAt!.toString().substring(11,16),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w200,
                    color:isUserMessage
                        ? AppColor.kTextWhiteColor
                        : AppColor.kTextLightColor,
                    fontSize: 12.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
