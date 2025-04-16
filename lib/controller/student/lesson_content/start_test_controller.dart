import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/controller/student/lesson_content/lesson_details_controller.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/lesson_details.dart';
import 'package:school/data/model/exam/submit_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/model/q_a_model.dart';

abstract class StartTest extends GetxController {
  nextPage();
  onPageChanged(int indexpage);
  toggle(bool press);
}

class StartTestImp extends StartTest {
  late PageController pageController;
  int currentPage = 0;
  var isPress = false;
  @override
  void toggle(bool press) {
    isPress = press;
    update();
  }

  @override
  nextPage() {
    if (currentPage > questionsList.length - 1) {
      showConfirmationDialog();
    } else {
      currentPage++;

      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 700), curve: Curves.bounceIn);
      // AudioController a = Get.find();
      // a.onClose();
    }
  }

  previousPage() {
    if (currentPage < 0) {
      //Get.offAllNamed(AppRoute.signUp);
    } else {
      currentPage--;

      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 700), curve: Curves.bounceIn);
      // AudioController a = Get.find();
      // a.onClose();
      // a.stopAudio();
    }
  }

  @override
  onPageChanged(int indexpage) {
    currentPage = indexpage;
    update();
  }

  void showConfirmationDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'تأكيد إنهاء الامتحان',
          style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
              fontSize: 18,
              color: AppColor.kTextBlackColor,
              fontWeight: FontWeight.w800),
        ),
        content: Text(
          'هل أنت متأكد أنك تريد إنهاء الامتحان؟',
          style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
              fontSize: 16,
              color: AppColor.kTextBlackColor,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              submitExam();
            },
            child: Text('نعم'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('تراجع'),
          ),
        ],
      ),
    );
  }

  LessonDetailsData examsData = LessonDetailsData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  late int examId;
  MyServices myServices = Get.find();
  List dataQuestions = [];
  List<Question> questionsList = [];
  late String roomId;
  late String studentId;
  List<TextEditingController> textControllers = [];

  getQuestions() async {
    textControllers.clear();

    print("================ Controller");
    dataQuestions.clear();
    questionsList.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await examsData.getStartExamsData(examId.toString(), studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataQuestions.length}questions");
      dataQuestions.addAll(response['questions']);

      for (int i = 0; i < dataQuestions.length; i++) {
        questionsList.add(
          Question.fromJson(dataQuestions[i]),
        );
        textControllers.add(TextEditingController());
      }
      print("[[[[[[[[[[[[[]]]]]]]]]");

      print(response['questions']);
      print(questionsList.length);
      update();
    }
  }

Map<int, Submit> submissions = {};

  void updateSelectedOptions(
       int questionId, String option, bool isSelected) {
    // تحقق من وجود كائن Submit للسؤال في القاموس
    if (!submissions.containsKey(questionId)) {
      // إذا لم يوجد، أضف كائن Submit جديد
      submissions[questionId] =
          Submit(questionNumber: questionId, selectedOptions: []);
    }

    // قم بتحديث selectedOptions
    if (isSelected) {
      submissions[questionId]!.selectedOptions.add(option);
    } else {
      submissions[questionId]!.selectedOptions.remove(option);
    }

    print(submissions[questionId]!.questionNumber);
    print(submissions[questionId]!.selectedOptions);
    print(submissions.length);
    print(submissions);
    pppp();
    update();
  }


  void addTraditionalAnswer(int questionId, String answerText) {
    if (!submissions.containsKey(questionId)) {
      submissions[questionId] = Submit(
        questionNumber: questionId,
        selectedOptions: [],
        traditionalAnswer: answerText,
      );
    } else {
      submissions[questionId]!.traditionalAnswer = answerText;
    }

    print(submissions[questionId]!.questionNumber);
    print(submissions[questionId]!.selectedOptions);
    print(submissions[questionId]!.traditionalAnswer);
    print(submissions.length);
    print(submissions);
        pppp();

    update();
  }
  @override
  void onInit() {
    pageController = PageController();
    studentId = myServices.box.read("student_id");
    examId = Get.arguments['examId'];
    getQuestions();
    super.onInit();
  }

 pppp() {
    print(submissions
        .map((key, value) => MapEntry(key.toString(), value.toMap()))
        .values
        .toList());
  }

  submitExam() async {
    statusRequest = StatusRequest.loading;
    update();
    print("11111111111 Controller");
     print(submissions
        .map((key, value) => MapEntry(key.toString(), value.toMap()))
        .values
        .toList());
    
    var response = await examsData.submitpostdata(
        studentId,
        examId.toString(),
       submissions
          .map((key, value) => MapEntry(key.toString(), value.toMap()))
          .values
          .toList(),);

    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      print(response);
      Get.back();
      LessonDetailsController examController =
          Get.put(LessonDetailsController());
      examController.getLessonDetailTests();
      Get.snackbar('نجاح', 'تم إنهاء الامتحان بنجاح!');
      update();
    }
    // }
  }

  void downLoadExam(String url) async {
    await launchUrl(
      Uri.parse("${AppLink.serverimage}/$url"),
      mode: LaunchMode.externalApplication,
    );
  }
}
