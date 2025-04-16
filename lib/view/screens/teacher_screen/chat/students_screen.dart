import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/chat/get_student_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/view/screens/teacher_screen/chat/admin_chat.dart';
import 'package:school/view/widgets/chat_widget/custtom_send_button.dart';
import 'package:school/view/widgets/teacher_widgets/chat/student_card.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetStudentsController controller = Get.put(GetStudentsController());
    return Scaffold(
        appBar: AppBar(
          title: Text('الطلاب'),
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
          child: GetBuilder<GetStudentsController>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  itemCount: controller.teachersList.length,
                  itemBuilder: (context, index) {
                    final student = controller.teachersList[index];
                    return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.teacherMessages,
                              arguments: {"student": student});
                        },
                        child: StudentCard(student: student)
                        );
                  },
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
            _showDialog();
          },
          child: Icon(Icons.message),
        ));
  }

  void _showDialog() {

    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('إرسال رسالة جديدة',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: AppColor.kTextBlackColor)),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.singleMessage);
                  },
                  child: CustomSendButton(
                    title: "رسالة فردية",
                    icon: Icons.person,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.multiMessage);
                  },
                  child: CustomSendButton(
                      title: "رسالة جماعية", icon: Icons.group),
                ),
                   SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Get.to(()=>AdminChatScreen());
                  },
                  child: CustomSendButton(
                    title: "رسالة للأدمن",
                    icon: Icons.chat,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

