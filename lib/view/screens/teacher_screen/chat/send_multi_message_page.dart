import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/chat/type_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/screens/teacher_screen/chat/send_single_message_page.dart';
import 'package:school/view/widgets/chat_widget/type_chat/custom_send_container.dart';
import 'package:school/view/widgets/chat_widget/type_chat/drop_down_item.dart';

class SendMultiMessagePage extends StatelessWidget {
  final GetTypeInfoController controller = Get.put(GetTypeInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إرسال رسالة جماعية',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColor.kOtherColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
              topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
            )),
        clipBehavior: Clip.antiAlias,
        child: GetBuilder<GetTypeInfoController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequestSend,
            widget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(children: [
                  SizedBox(height: 40),
                  controller.classesList.isNotEmpty
                      ? CustomDropDown(
                          hintText: 'اختر الصف',
                          onChanged: controller.selectClass,
                          items: controller.classesList.map((classData) {
                            return DropdownMenuItem<String>(
                                value: classData.name,
                                child: ItemDropDown(
                                  name: classData.name!,
                                ));
                          }).toList(),
                          value: controller.selectedClass.value.isEmpty
                              ? null
                              : controller.selectedClass.value,
                        )
                      : Container(),
                  SizedBox(height: 20),
                  if (controller.roomsList.isNotEmpty) ...[
                    CustomDropDown(
                      hintText: 'اختر الشعبة',
                      onChanged: controller.selectRoom,
                      items: controller.roomsList.map((roomData) {
                        return DropdownMenuItem<String>(
                            value: roomData.name,
                            child: ItemDropDown(
                              name: roomData.name!,
                            ));
                      }).toList(),
                      value: controller.selectedSection.value.isEmpty
                          ? null
                          : controller.selectedSection.value,
                    ),
                    SizedBox(height: 20),
                  ],
                  controller.selectedSection.value.isNotEmpty
                      ? CustomSendContainer(controller: controller.textEditingController,)
                      : Container(),
                  SizedBox(height: 20),
                  controller.selectedSection.value.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            if (controller
                                .textEditingController.text.isNotEmpty) {
                              controller.sendGroupMessage();
                              controller.textEditingController.clear();
                            } else {
                              Get.snackbar(
                                  'تنبيه', 'لا يمكن إرسال رسالة فارغة');
                            }
                          },
                          child: CustomSend())
                      : Container(),
                ])),
          ),
        ),
      ),
    );
  }
}