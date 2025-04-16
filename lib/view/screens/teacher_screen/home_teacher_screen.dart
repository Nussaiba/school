import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/teacher/teacher_home_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/general/background.dart';
import 'package:school/view/widgets/general/custom_half_sized_box.dart';
import 'package:school/view/widgets/home_widget/student_image.dart';
import 'package:school/view/widgets/home_widget/student_name.dart';
import 'package:school/view/widgets/home_widget/student_year.dart';
import 'package:school/view/widgets/teacher_widgets/home_widgets/item.dart';

class HomeTeacherScreen extends StatelessWidget {
  const HomeTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherHomeController());

    return Scaffold(
        body: CustomBackGround(
      widget: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            padding: EdgeInsets.all(AppPadding.kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          text1: 'م .',
                          text2: controller.name,
                        ),
                        CustomHalfSizedBox(),
                        CustomHalfSizedBox(),
                        StudentYear(),
                      ],
                    ),
                    SizedBox(
                      height: AppPadding.kDefaultPadding / 6,
                    ),
                     Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          StudentImage(),
                          IconButton(
                              onPressed: () {
                                controller.logout();
                              },
                              icon: Icon(
                                Icons.logout_outlined,
                                color: AppColor.kOtherColor,
                                size: 22,
                              )),
                        ],
                      )
                    // Column(
                    //   children: [
                    //     StudentImage(),
                    //      Row(
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.all(14.0),
                    //             child: IconButton(
                    //                 onPressed: () {
                    //                   controller.logout();
                    //                 },
                    //                 icon: Icon(
                    //                   Icons.logout_outlined,
                    //                   color: AppColor.kpraimaryColor,
                    //                   size: 30,
                    //                 )),
                    //           ),
                    //           Spacer(),
                    //         ],
                       //   )
                    //  ],
                  //  )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColor.kOtherColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
                      topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: GetBuilder<TeacherHomeController>(
                    builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              itemCount: controller.items.length,
                              itemBuilder: (context, index) {
                                return HomeItem(
                                    itemModel: controller.items[index],
                                    i: index);
                              },
                            ),
                          ),
                          Spacer(),
                         
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
