import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class StartExamsData {
  Crud crud;
  StartExamsData(this.crud);

  getStartExamsData(String examId, String studentId) async {
        print("================================================================================");

    print("${AppLink.startexam}/$examId/$studentId");
    var response =
        await crud.getData("${AppLink.startexam}/$examId/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
