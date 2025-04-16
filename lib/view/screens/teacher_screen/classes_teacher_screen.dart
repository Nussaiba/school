import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/classes_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/screens/teacher_screen/rooms_screen.dart';
import 'package:school/view/widgets/general/no_data.dart';
import 'package:school/view/widgets/teacher_widgets/classes_widgets/class_card.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(ClassController());

    return Scaffold(
      appBar: AppBar(
        title: Text('الصفوف'),
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
        child: GetBuilder<ClassController>(
          builder: (classController) => HandlingDataRequest(
            statusRequest: classController.statusRequest,
            widget: Padding(
              padding: EdgeInsets.all(AppPadding.kDefaultPadding / 2),
              child: Center(
                child: 
                 classController.classesList.isEmpty?
                 CustomNoData(
                       
                          text: 'لا يوجد صفوف  .'):
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: classController.classesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => RoomsScreen( 
                        ),
                        arguments: {
                          'classModel' : classController.classesList[index]
                        });
                      },
                      child: ClassCard(
                    
                        classModel: classController.classesList[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
