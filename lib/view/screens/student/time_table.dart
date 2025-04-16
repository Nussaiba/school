import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/schedule_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/time_table_widget/lesson_card.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatelessWidget {
  // final ScheduleController controller = Get.put(ScheduleController());

  final ScheduleController controller = Get.put(ScheduleController());

  SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: controller.days.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text('البرنامج المدرسي'),
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
                child: GetBuilder<ScheduleController>(
                  builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: HandlingDataRequest(
                      statusRequest: controller.statusRequest3,
                      widget: HandlingDataRequest(
                        statusRequest: controller.statusRequest2,
                        widget: DefaultTabController(
                          length: controller.days.length,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 10.0),
                                child: ButtonsTabBar(
                                  height: 56,
                                  backgroundColor: AppColor.ksecondColor,
                                  splashColor: AppColor.kTextLightColor,
                                  unselectedLabelStyle: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  unselectedDecoration: BoxDecoration(
                                    color: AppColor.kOtherColor,
                                  ),
                                  tabs: controller.days.map((day) {
                                    return Tab(
                                        text:
                                            // day.day.toString()
                                            controller.getDayNameById(day.day));
                                  }).toList(),
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                    children: List.generate(
                                        controller.days.length, (dayIndex) {
                                  return controller
                                          .days[dayIndex].lessons!.isEmpty
                                      ? Center(
                                          child: Text(
                                            'لا يوجد دروس لهذا اليوم',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    color: AppColor
                                                        .kTextLightColor),
                                          ),
                                        )
                                      : Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0),
                                            child: ListView.builder(
                                              itemCount: controller
                                                  .days[dayIndex]
                                                  .lessons!
                                                  .length,
                                              itemBuilder:
                                                  (context, lessonIndex) {
                                                final lesson = controller
                                                    .days[dayIndex]
                                                    .lessons![lessonIndex];
                                                return CustomLessonCard(
                                                  onTap: controller
                                                              .days[dayIndex]
                                                              .lessons![
                                                                  lessonIndex]
                                                              .meetingLink !=
                                                          null
                                                      ? () {
                                                          final currentDate =
                                                              DateFormat(
                                                                      'yyyy-MM-dd')
                                                                  .format(DateTime
                                                                      .now());

                                                          final currentTime =
                                                              DateTime.now();
                                                          print("now");
                                                          print(currentTime);
                                                          print("lesson time");
                                                          print(
                                                              "${controller.timesList.firstWhere((time) => time.id == (controller.days[dayIndex].lessons![lessonIndex].lectureTimeId)).startTime}");
                                                                 print(
                                                              "${controller.timesList.firstWhere((time) => time.id == (controller.days[dayIndex].lessons![lessonIndex].lectureTimeId)).endTime}");

                                                          final startTime =
                                                              DateTime.parse(
                                                                  "$currentDate ${controller.timesList.firstWhere((time) => time.id == (controller.days[dayIndex].lessons![lessonIndex].lectureTimeId)).startTime!}");
                                                          print("startTime");

                                                          print(startTime);

                                                          final endTime =
                                                              DateTime.parse(
                                                                  "$currentDate ${controller.timesList.firstWhere((time) => time.id == (controller.days[dayIndex].lessons![lessonIndex].lectureTimeId)).endTime!}");
                                                          print("endTime");

                                                          print(endTime);

                                                          if (currentTime.isAfter(
                                                                  startTime) &&
                                                              currentTime
                                                                  .isBefore(
                                                                      endTime)) {
                                                            controller.launchURL(
                                                                controller
                                                                    .days[
                                                                        dayIndex]
                                                                    .lessons![
                                                                        lessonIndex]
                                                                    .meetingLink!);
                                                            controller.setAttendanceStudent(
                                                                controller
                                                                    .days[
                                                                        dayIndex]
                                                                    .lessons![
                                                                        lessonIndex]
                                                                    .id,
                                                                controller
                                                                    .days[
                                                                        dayIndex]
                                                                    .day,
                                                                controller.timesList
                                                                    .firstWhere((time) =>
                                                                        time.id ==
                                                                        (controller
                                                                            .days[dayIndex]
                                                                            .lessons![lessonIndex]
                                                                            .lectureTimeId))
                                                                    .id);
                                                          } else if (currentTime
                                                              .isAfter(
                                                                  endTime)) {
                                                            Get.snackbar(
                                                                'تنبيه',
                                                                "الحصة انتهت");
                                                          } else {
                                                            Get.snackbar(
                                                                'تنبيه',
                                                                "لم يحن موعد الدرس بعد");
                                                          }
                                                        }
                                                      : () {},
                                                  lesson: lesson,
                                                  lectureTime: controller
                                                      .timesList
                                                      .firstWhere((time) =>
                                                          time.id ==
                                                          (controller
                                                              .days[dayIndex]
                                                              .lessons![
                                                                  lessonIndex]
                                                              .lectureTimeId)),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                })),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))));
  }
}
