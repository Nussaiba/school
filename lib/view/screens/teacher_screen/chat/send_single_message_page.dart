import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/chat/type_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/chat_widget/type_chat/custom_send_container.dart';
import 'package:school/view/widgets/chat_widget/type_chat/drop_down_item.dart';

class SendSingleMessagePage extends StatelessWidget {
  final GetTypeInfoController controller = Get.put(GetTypeInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إرسال رسالة فردية',
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
                  if (controller.studentsList.isNotEmpty) ...[
                    CustomDropDown(
                      hintText: 'اختر الطالب',
                      items: controller.studentsList.map((student) {
                        return DropdownMenuItem<String>(
                          value: student.firstName,
                          child: ItemDropDown(
                                  name: "${student.firstName} ${student.lastName}",
                                ));
                      }).toList(),
                      value: controller.selectedStudent.value.isEmpty
                          ? null
                          : controller.selectedStudent.value,
                      onChanged: controller.selectStudent,
                    ),
                    SizedBox(height: 20),
                  ],
                  controller.selectedStudent.value.isNotEmpty
                      ? CustomSendContainer(
                          controller: controller.textEditingController,
                        )
                      : Container(),
                  SizedBox(height: 20),
                  controller.selectedStudent.value.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            if (controller
                                .textEditingController.text.isNotEmpty) {
                              controller.sendSingleMessage();
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

class CustomSend extends StatelessWidget {
  const CustomSend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: AppPadding.kDefaultPadding / 2,
          right: AppPadding.kDefaultPadding / 2,
        ),
        width: Get.width / 2,
        height: 50.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColor.ksecondColor,
                  AppColor.kpraimaryColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: [
                  0.0,
                  1.0,
                ],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('إرسال',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Colors.white,
                    )),
            SizedBox(width: 20),
            Icon(Icons.send, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hintText,
    this.onChanged,
    this.items,
    this.value,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  });

  final String hintText;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final EdgeInsetsGeometry padding; // Added padding parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            width: 1), // Use a standard color here for better visibility
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        // Added Padding Widget here.
        padding: padding,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              hintText,
              style: TextStyle(color: Colors.grey[600]),
            ),
            value: value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors
                      .black, // Use a standard color here for better visibility
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
            onChanged: onChanged,
            items: items,
            icon: Icon(Icons.arrow_drop_down,
                color: Colors
                    .grey), // Use a standard color here for better visibility
          ),
        ),
      ),
    );
  }
}
