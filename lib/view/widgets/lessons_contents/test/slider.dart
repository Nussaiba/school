import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/exam/audio_controller.dart';
import 'package:school/controller/student/lesson_content/start_test_controller.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/exams_widgets/audio_card.dart';
import 'package:school/view/widgets/exams_widgets/custom_test_field.dart';

class CustomSliderTest extends GetView<StartTestImp> {
  @override
  Widget build(BuildContext context) {
    final con = Get.put(StartTestImp());

    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
          AudioController a = Get.put(AudioController());
          a.stopAudio();
          a.duration = Duration.zero.obs;
          a.position = Duration.zero.obs;
          // a.audioPlayer.dispose();
        },
        itemCount: con.questionsList.length,
        itemBuilder: (context, i) => Center(
              child:
                  //سؤال مؤتمت عادي
                  con.questionsList[i].quesType == 1 &&
                          con.questionsList[i].section == null
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Image.asset(
                              AppImageAsset.examIcon,
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                                '${i + 1}_ ${con.questionsList[i].questionForm}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColor.kTextBlackColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.0,
                                    )),
                            const SizedBox(height: 10),
                            GetBuilder<StartTestImp>(
                              builder: (controller) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: controller
                                      .questionsList[i].option!.myOptions!
                                      .map((option) {
                                    return ListTile(
                                      title: Text(option),
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: AppColor.kTextLightColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.0,
                                          ),
                                      leading: Checkbox(
                                        value: con.submissions.containsKey(
                                                con.questionsList[i].id) &&
                                            con
                                                .submissions[
                                                    con.questionsList[i].id]!
                                                .selectedOptions
                                                .contains(option),
                                        onChanged: (bool? value) {
                                          if (value != null) {
                                            controller.updateSelectedOptions(
                                                // i,
                                                con.questionsList[i].id!,
                                                option,
                                                value);
                                          }
                                        },
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            )
                          ],
                        )
                      :
                      //فقرة
                      con.questionsList[i].quesType == 1 &&
                              con.questionsList[i].section!.type! == 0
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Image.asset(
                                  AppImageAsset.examIcon,
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                    '${i + 1}_ ${con.questionsList[i].questionForm}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColor.kTextBlackColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20.0,
                                        )),
                                const SizedBox(height: 10),
                                Text('${con.questionsList[i].section!.content}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColor.kTextBlackColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0,
                                        )),
                                const SizedBox(height: 10),
                                GetBuilder<StartTestImp>(
                                  builder: (controller) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: controller
                                          .questionsList[i].option!.myOptions!
                                          .map((option) {
                                        return ListTile(
                                          title: Text(option),
                                          titleTextStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: AppColor.kTextLightColor,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18.0,
                                              ),
                                          leading: Checkbox(
                                            value: con.submissions.containsKey(
                                                con.questionsList[i].id) &&
                                            con
                                                .submissions[
                                                    con.questionsList[i].id]!
                                                .selectedOptions!
                                                .contains(option),
                                            onChanged: (bool? value) {
                                              if (value != null) {
                                                controller
                                                    .updateSelectedOptions(
                                                        // i,
                                                        con.questionsList[i]
                                                            .id!,
                                                        option,
                                                        value);
                                              }
                                            },
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                )
                              ],
                            )
                          :
                          //صورة
                          con.questionsList[i].quesType == 1 &&
                                  con.questionsList[i].section!.type! == 3
                              ? Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListView(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          '${i + 1}_ ${con.questionsList[i].questionForm}',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: AppColor.kTextBlackColor,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20.0,
                                              )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Image.network(
                                        "${AppLink.serverimage}${con.questionsList[i].section!.content!}",
                                        width: 150,
                                        height: 150,
                                      ),
                                      const SizedBox(height: 10),
                                      GetBuilder<StartTestImp>(
                                        builder: (controller) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: controller
                                                .questionsList[i]
                                                .option!
                                                .myOptions!
                                                .map((option) {
                                              return ListTile(
                                                title: Text(option),
                                                titleTextStyle:
                                                    Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: AppColor
                                                              .kTextLightColor,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 18.0,
                                                        ),
                                                leading: Checkbox(
                                                  value:
                                                     con.submissions.containsKey(
                                                con.questionsList[i].id) &&
                                            con
                                                .submissions[
                                                    con.questionsList[i].id]!
                                                .selectedOptions!
                                                .contains(option),
                                                  onChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller
                                                          .updateSelectedOptions(
                                                              // i,
                                                              con
                                                                  .questionsList[
                                                                      i]
                                                                  .id!,
                                                              option,
                                                              value);
                                                    }
                                                  },
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ):
                               //صوت
                                  con.questionsList[i].quesType == 1 &&
                                          con.questionsList[i].section!.type! ==
                                              2
                                      ? Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ListView(
                                            children: [
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Image.asset(
                                                AppImageAsset.examIcon,
                                                width: 100,
                                                height: 100,
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                  '${i + 1}_ ${con.questionsList[i].questionForm}',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        color: AppColor
                                                            .kTextBlackColor,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 20.0,
                                                      )),
                                              AudioPage(
                                                  url:
                                                      "${AppLink.serverimage}${con.questionsList[i].section!.content!}"),
                                              GetBuilder<
                                                  StartTestImp>(
                                                builder: (controller) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: controller
                                                        .questionsList[i]
                                                        .option!
                                                        .myOptions!
                                                        .map((option) {
                                                      return ListTile(
                                                        title: Text(option),
                                                        titleTextStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                  color: AppColor
                                                                      .kTextLightColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                        leading: Checkbox(
                                                          value: con.submissions.containsKey(
                                                con.questionsList[i].id) &&
                                            con
                                                .submissions[
                                                    con.questionsList[i].id]!
                                                .selectedOptions!
                                                .contains(option),
                                                          onChanged:
                                                              (bool? value) {
                                                            if (value != null) {
                                                              controller
                                                                  .updateSelectedOptions(
                                                                      // i,
                                                                      con
                                                                          .questionsList[
                                                                              i]
                                                                          .id!,
                                                                      option,
                                                                      value);
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    }).toList(),
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                  //تقليدي
                                   : con.questionsList[i].quesType == 2 &&
                                          con.questionsList[i].section == null
                                      //    بدون فقرة  تقليدي
                                      ? Column(
                                          children: [
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Image.asset(
                                              AppImageAsset.examIcon,
                                              width: 100,
                                              height: 100,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                                '${i + 1}_ ${con.questionsList[i].questionForm}',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: AppColor
                                                          .kTextBlackColor,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 20.0,
                                                    )),
                                            const SizedBox(height: 20),
                                            CustomTextFieldTest(
                                              con: con,
                                              onChanged: (text) {
                                                controller.addTraditionalAnswer(
                                                    // i,
                                                    con.questionsList[i].id!,
                                                    text);
                                              },
                                              textcontroller:
                                                  controller.textControllers[i],
                                            ),
                                          ],
                                        )
                                      :

                                      //فقرة تقليدي
                                      con.questionsList[i].quesType == 2 &&
                                              con.questionsList[i].section!
                                                      .type! ==
                                                  0
                                          ? Column(
                                              children: [
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Image.asset(
                                                  AppImageAsset.examIcon,
                                                  width: 100,
                                                  height: 100,
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                      '${i + 1}_ اقرأ الفقرة و أجب عن السؤال التالي :',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color: AppColor
                                                                .kTextBlackColor,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 18.0,
                                                          )),
                                                ),
                                                Text(
                                                    '${con.questionsList[i].questionForm}',
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          color: AppColor
                                                              .kTextBlackColor,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 20.0,
                                                        )),
                                                const SizedBox(height: 10),
                                                Text(
                                                    '${con.questionsList[i].section!.content}',
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          color: AppColor
                                                              .kTextBlackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18.0,
                                                        )),
                                                const SizedBox(height: 10),
                                                CustomTextFieldTest(
                                                  con: con,
                                                  onChanged: (text) {
                                                    controller
                                                        .addTraditionalAnswer(
                                                            // i,
                                                            con.questionsList[i]
                                                                .id!,
                                                            text);
                                                  },
                                                  textcontroller: controller
                                                      .textControllers[i],
                                                ),
                                              ],
                                            )
                                          :

//صورة
                                          con.questionsList[i].quesType == 2 &&
                                                  con.questionsList[i].section!
                                                          .type! ==
                                                      3
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Text(
                                                            '${i + 1}_ شاهد الصورة و أجب عن السؤال التالي :',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  color: AppColor
                                                                      .kTextBlackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      18.0,
                                                                )),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                          ' ${con.questionsList[i].questionForm}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    color: AppColor
                                                                        .kTextBlackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize:
                                                                        20.0,
                                                                  )),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Image.network(
                                                        "${AppLink.serverimage}${con.questionsList[i].section!.content!}",
                                                        width: 150,
                                                        height: 150,
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      CustomTextFieldTest(
                                                        con: con,
                                                        onChanged: (text) {
                                                          controller
                                                              .addTraditionalAnswer(
                                                                  // i,
                                                                  con
                                                                      .questionsList[
                                                                          i]
                                                                      .id!,
                                                                  text);
                                                        },
                                                        textcontroller: controller
                                                            .textControllers[i],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              :
                                              //  تقليدي صوت
                                              con.questionsList[i].quesType ==
                                                          2 &&
                                                      con.questionsList[i]
                                                              .section!.type! ==
                                                          2
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 40,
                                                          ),
                                                          Image.asset(
                                                            AppImageAsset
                                                                .examIcon,
                                                            width: 100,
                                                            height: 100,
                                                          ),
                                                          const SizedBox(
                                                            height: 30,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: Text(
                                                                '${i + 1}_ استمع للصوت و أجب عن السؤال التالي :',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                      color: AppColor
                                                                          .kTextBlackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          18.0,
                                                                    )),
                                                          ),
                                                          Text(
                                                              '${con.questionsList[i].questionForm}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    color: AppColor
                                                                        .kTextBlackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    fontSize:
                                                                        20.0,
                                                                  )),
                                                          AudioPage(
                                                              url:
                                                                  "${AppLink.serverimage}${con.questionsList[i].section!.content!}"),
                                                          CustomTextFieldTest(
                                                            con: con,
                                                            onChanged: (text) {
                                                              controller
                                                                  .addTraditionalAnswer(
                                                                      // i,
                                                                      con
                                                                          .questionsList[
                                                                              i]
                                                                          .id!,
                                                                      text);
                                                            },
                                                            textcontroller:
                                                                controller
                                                                    .textControllers[i],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                 
            ));
  }
}



class CustomTextFieldTest extends StatelessWidget {
  const CustomTextFieldTest({
    super.key,
    required this.con,
    this.onChanged,
    this.textcontroller,
  });

  final StartTestImp  con;
  final void Function(String)? onChanged;
  final TextEditingController? textcontroller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartTestImp >(
      builder: (controller) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding),
                border: Border.all(
                  color: AppColor.kpraimaryColor,
                  width: 1,
                ),
              ),
              margin: EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textcontroller,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.kTextBlackColor,
                        fontSize: 16.0,
                      ),
                  maxLines: null,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "اكتب إجابتك هنا...",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.kTextLightColor,
                          fontSize: 16.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
