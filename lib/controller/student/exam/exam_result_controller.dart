import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/exam/exam_result.dart';
import 'package:school/data/model/exam/result_model.dart';
import 'package:school/data/model/q_a_model.dart';

class ExamResultController extends GetxController {
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

  ExamResultData examsData = ExamResultData(Get.find());
  ExamResultModel? examResult;

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
      examResult = ExamResultModel.fromJson(data);
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
