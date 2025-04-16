import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/home_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/general/background.dart';
import 'package:school/view/widgets/general/custom_half_sized_box.dart';
import 'package:school/view/widgets/home_widget/grid_item.dart';
import 'package:school/view/widgets/home_widget/student_class.dart';
import 'package:school/view/widgets/home_widget/student_image.dart';
import 'package:school/view/widgets/home_widget/student_name.dart';
import 'package:school/view/widgets/home_widget/student_year.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: CustomBackGround(
        widget: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              //  color: AppColor.kOtherColor,
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
                            text1: 'مرحباً',
                            text2: controller.name,
                          ),
                          CustomHalfSizedBox(),
                          StudentClass(
                              text1: controller.studentClass,
                              text2: controller.room),
                          CustomHalfSizedBox(),
                          StudentYear(),
                        ],
                      ),
                      SizedBox(
                        width: AppPadding.kDefaultPadding / 6,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          StudentImage(),
                          IconButton(
                              onPressed: () {
                                controller.logout();
                              },
                              icon: Icon(
                                Icons.logout_outlined,
                                color: AppColor.kOtherColor,
                                size: 20,
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                //  width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height / 2.5,
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
                  child: GetBuilder<HomeController>(
                    builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemCount: controller.items.length,
                          itemBuilder: (context, index) {
                            return
                                HomeGridItem(
                                    itemModel: controller.items[index],
                                    i: index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
