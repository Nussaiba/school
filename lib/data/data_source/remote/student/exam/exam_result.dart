import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class ExamResultData {
  Crud crud;
  ExamResultData(this.crud);

  getExamResultData(String examId, String studentId) async {
    print(
        "==============================================================================================================================");
    print("${AppLink.viewexam}/$examId/$studentId");
    var response = await crud.getData("${AppLink.viewexam}/$examId/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
