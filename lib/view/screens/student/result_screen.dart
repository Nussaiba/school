import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/graduate_controller.dart';
import 'package:school/controller/student/result_controller.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/result_widget/circuler.dart';
import 'package:collection/collection.dart';
import 'package:school/view/widgets/result_widget/result_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResultController());
       Get.put(GraduateController());

    
    int oMarks = controller.results.map((e) => e.obtainedMarks!).sum.toInt();
    int tMarks = controller.results.map((e) => e.totalMarks!).sum.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text('الجلاء المدرسي'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.all(3),
              height: 160,
              child: CustomPaint(
                foregroundPainter: CircularPainter(
                  backgroundColor: AppColor.kpraimaryColor,
                  lineColor: AppColor.kOtherColor,
                  width: 5,
                ),
                child: Center(
                  child: Text(
                    oMarks.toString() + '\n / \n ' + tMarks.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
           SizedBox(
            height: AppPadding.kDefaultPadding,
          ),
          Text(
            ' النتيجة ممتاز ',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w900),
          ),
          Text('نور', style: Theme.of(context).textTheme.bodyMedium!),
          SizedBox(
            height: AppPadding.kDefaultPadding,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
                    topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
                  )),
              child: ListView.builder(
                padding: EdgeInsets.all(AppPadding.kDefaultPadding),
                itemCount: controller.results.length,
                itemBuilder: (context, index) {
                  return ResultCard(result: controller.results[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
