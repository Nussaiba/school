import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school/controller/student/graduate_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';

class GraduateScreen extends StatelessWidget {
  const GraduateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GraduateController());

    return Scaffold(
      appBar: AppBar(
        title: Text('الجلاء المدرسي'),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColor.kOtherColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
              topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
            )),
        child: GetBuilder<GraduateController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  controller.status == 0
                      ? Text("${controller.message}",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColor.kpraimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                          ))
                      : Column(
                        children: [
                          Text("صدرت الجلاءات",
                              style:
                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: AppColor.kpraimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ],
                              )),
                            SizedBox(height: 6,),
                              //  Text("مبروك",
                              // style:
                              //     Theme.of(context).textTheme.bodySmall!.copyWith(
                              //   color: AppColor.kpraimaryColor,
                              //   fontWeight: FontWeight.bold,
                              //   fontSize: 22.0,
                              //   shadows: [
                              //     Shadow(
                              //       offset: Offset(4.0, 4.0),
                              //       blurRadius: 2.0,
                              //       color: Colors.grey.withOpacity(0.5),
                              //     ),
                              //   ],
                              // )),
                        ],
                      ),
                  Lottie.asset(AppImageAsset.grad, repeat: false),
                  Container(
                    height: 40,
                  ),
                  controller.status == 1
                      ? GestureDetector(
                          onTap: () {
                            controller.launchURL();
                          },
                          child: Text("اضغط للتحميل",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                color: AppColor.kTextLightColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ],
                              )),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
