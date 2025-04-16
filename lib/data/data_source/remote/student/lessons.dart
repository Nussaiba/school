import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class LessonsData {
  Crud crud;
  LessonsData(this.crud);

  getAllLessonsData(int subjectid,   String roomId, String studentId ) async {
      print("=============================getAllLessonsData====================================");

    print("${AppLink.lessons}/$subjectid/$roomId/$studentId");
    var response = await crud.getData("${AppLink.lessons}/$subjectid/$roomId/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
