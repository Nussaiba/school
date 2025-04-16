import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/medals_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';

class MedalsScreen extends StatelessWidget {
  const MedalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MedalsController());

    return Scaffold(
      appBar: AppBar(
        title: Text('الجوائز'),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
          child: GetBuilder<MedalsController>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.medalsList.length,
                itemBuilder: (context, index) {
                  final medal = controller.medalsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                       elevation: 4.0,
  shadowColor: AppColor.kpraimaryColor.withOpacity(0.5),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0), 
  ),
                    color: AppColor.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                // medal.type == 1
                                //     ? Image.asset(
                                //         AppImageAsset.goldMedal,
                                //         scale: 9.0,
                                //       )
                                //     : Image.asset(
                                //         AppImageAsset.silverMedal,
                                //         scale: 9.0,
                                //       ),
                            
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                          "${AppLink.serverimage}/${medal.rewardAndSanction.image}",
                                          scale: 4.50,
                                        ),
                            ),
                            
                                Expanded(
                              flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          medal.rewardAndSanction.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: AppColor.kpraimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              )),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          medal.lesson.name!.length > 22
                                              ? "${medal.lesson.name!.substring(0, 21)}...."
                                              : medal.lesson.name!,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: AppColor.ksecondColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              )),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text("بتاريخ : ${medal.createdAt.toString().substring(0, 10)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: AppColor.kTextLightColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                              )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        
                        // SizedBox(height: 2,)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
