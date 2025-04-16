import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/lesson_details.dart';
import 'package:school/data/model/q_a_model.dart';
import 'package:school/data/model/student/lesson_details/result_model.dart';

class TestResultController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    studentId = myServices.box.read("student_id");
    examId = Get.arguments['examId'];
    examResult = await getExamResult();
    print(studentId);
    print(examId);
    print("Loooooooooooooad");
  }

  LessonDetailsData examsData = LessonDetailsData(Get.find());
  TestResultModel? examResult;

  late StatusRequest statusRequest = StatusRequest.none;
  late int examId;
  MyServices myServices = Get.find();
  late String roomId;
  late String studentId;
 List dataQuestions = [];
  List<Question> questionsList = [];
  getExamResult() async {
    print("================ Controller");
    statusRequest = StatusRequest.loading;
    var response =
        await examsData.getExamResultData(examId.toString(), studentId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      final data = response;
      examResult = TestResultModel.fromJson(data);
                update();
                 dataQuestions.addAll(response['questions']);
      
      for (int i = 0; i < dataQuestions.length; i++) {
        questionsList.add(
          Question.fromJson(dataQuestions[i]),
        );
      }
      return examResult;
      
    }
    update();
  }
}
