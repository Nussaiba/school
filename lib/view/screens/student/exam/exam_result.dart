import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/exam/exam_result_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/exams_widgets/audio_result.dart';

class ExamResultScreen extends StatelessWidget {
  ExamResultScreen({super.key});
  ExamResultController controller = Get.put(ExamResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.kOtherColor,
      appBar: AppBar(
        title: Text('معاينة الامتحان'),
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
        child: GetBuilder<ExamResultController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Center(
                      child: Text(' ${controller.examResult?.exam?.name}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: AppColor.kTextBlackColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.0,
                                  height: 2)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("المادة : ${controller.examResult?.lessonName}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColor.kTextLightColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.0,
                                    height: 2)),
                        Spacer(),
                        Text("المدة : ${controller.examResult?.examPeriod}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColor.kTextLightColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.0,
                                    height: 2)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          Text('نتيجة الامتحان',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: AppColor.kTextBlackColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                      height: 2)),
                          Text(
                              "${controller.examResult?.studentResult}" +
                                  " " +
                                  "/" +
                                  " " +
                                  "${controller.examResult?.exam!.mark!}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: AppColor.kpraimaryColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.0,
                                      height: 2))
                        ],
                      ),
                    ),
                    GetBuilder<ExamResultController>(
                      builder: (controller) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.examResult?.questions!.length,
                          itemBuilder: (context, questionIndex) {
                            final question = controller
                                .examResult?.questions![questionIndex];
                            return question?.quesType == 1
                                ? 
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: AppColor.kOtherColor,
                                      border: Border.all(
                                        color: AppColor.ksecondColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.ksecondColor
                                              .withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                            '${questionIndex + 1}_ ${question!.questionForm}',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color:
                                                      AppColor.kTextBlackColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                )),
                                        //مؤتمت عادي
                                        question.quesType == 1 &&
                                                question.section == null
                                            ? Container()
                                            :
                                            //فقرة
                                            question.quesType == 1 &&
                                                    question.section!.type! == 0
                                                ? Center(
                                                    child: Text(
                                                        '${question.section!.content}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              color: AppColor
                                                                  .kTextBlackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16.0,
                                                            )),
                                                  )
                                                : //صورة
                                                question.quesType == 1 &&
                                                        question.section!
                                                                .type! ==
                                                            3
                                                    ? Center(
                                                        child: Image.network(
                                                          "${AppLink.serverimage}${question.section!.content!}",
                                                          width: 150,
                                                          height: 150,
                                                        ),
                                                      )
                                                    :

                                                    //                                  //صوت
                                                    question.quesType == 1 &&
                                                            question.section!
                                                                    .type! ==
                                                                2
                                                        ? AudioResultPage(
                                                            url:
                                                                "${AppLink.serverimage}${question.section!.content!}",
                                                            i: questionIndex,
                                                          )
                                                        : Container(),

                                        ...question.option!.myOptions!
                                            .map((option) {
                                          return ListTile(
                                            title: Text(
                                              option,
                                              style: TextStyle(
                                                color: controller
                                                            .examResult
                                                            ?.questions![
                                                                questionIndex]!
                                                            .answer!
                                                            .contains(option) ??
                                                        false
                                                    ? Colors.green
                                                    : (!controller
                                                                .examResult!
                                                                .questions![
                                                                    questionIndex]!
                                                                .answer!
                                                                .contains(
                                                                    option)) &&
                                                            (controller
                                                                .examResult!
                                                                .examResult!
                                                                .userAnswers[
                                                                    question.id
                                                                        .toString()]!
                                                                .contains(
                                                                    option))
                                                        ? Colors.red
                                                        : AppColor
                                                            .kTextLightColor,
                                              ),
                                            ),
                                            titleTextStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color:
                                                      AppColor.kTextLightColor,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 18.0,
                                                ),
                                            leading: Checkbox(
                                              value: controller
                                                      .examResult
                                                      ?.examResult
                                                      ?.userAnswers[question.id
                                                          .toString()]!
                                                      .contains(option) ??
                                                  false,
                                              onChanged: null,
                                              // activeColor:  Colors.grey,
                                              checkColor: Colors.grey,
                                              fillColor: MaterialStateProperty
                                                  .all<Color>(Colors.white),
                                            ),
                                          );
                                        }),

                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('درجة السؤال : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: AppColor
                                                              .kTextBlackColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16.0,
                                                          height: 2)),
                                              Text(
                                                  "${question.studentMark}" +
                                                      " " +
                                                      "/" +
                                                      " "
                                                  // + "${question.mark}"
                                                  ,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: AppColor
                                                              .kpraimaryColor,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 18.0,
                                                          height: 2))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: AppColor.kOtherColor,
                                      border: Border.all(
                                        color: AppColor.ksecondColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.ksecondColor
                                              .withOpacity(0.3),
                                          spreadRadius: 3,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                            '${questionIndex + 1}_ ${question!.questionForm}',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color:
                                                      AppColor.kTextBlackColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                )),
                                        //مؤتمت عادي
                                        question.quesType == 2 &&
                                                question.section == null
                                            ? Container()
                                            :

                                            //فقرة
                                            question.quesType == 2 &&
                                                    question.section!.type! == 0
                                                ? Center(
                                                    child: Text(
                                                        '${question.section!.content}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              color: AppColor
                                                                  .kTextBlackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16.0,
                                                            )),
                                                  )
                                                : //صورة
                                                question.quesType == 2 &&
                                                        question.section!
                                                                .type! ==
                                                            3
                                                    ? Center(
                                                        child: Image.network(
                                                          "${AppLink.serverimage}${question.section!.content!}",
                                                          width: 150,
                                                          height: 150,
                                                        ),
                                                      )
                                                    :
                                 //صوت
                                                    question.quesType == 2 &&
                                                            question.section!
                                                                    .type! ==
                                                                2
                                                        ? AudioResultPage(
                                                            url:
                                                                "${AppLink.serverimage}${question.section!.content!}",
                                                            i: questionIndex,
                                                          )
                                                        : Container(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Center(
                                            child: Text(
                                                " الإجابة :  ${question.answer![0]}",
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
                                        ),

                                        Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('درجة السؤال : ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: AppColor
                                                              .kTextBlackColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16.0,
                                                          height: 2)),
                                              Text(
                                                  "${question.studentMark}" +
                                                      " " +
                                                      "/" +
                                                      " "
                                                  // + "${question.mark}"
                                                  ,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: AppColor
                                                              .kpraimaryColor,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 18.0,
                                                          height: 2))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                          },
                        );
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
