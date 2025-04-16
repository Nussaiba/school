import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class TeacherSubjectsData {
  Crud crud;
  TeacherSubjectsData(this.crud);

  getAllSubjectsData(String roomId, String studentId) async {
    var response = await crud.getData("${AppLink.teacherSubjects}/$roomId/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
