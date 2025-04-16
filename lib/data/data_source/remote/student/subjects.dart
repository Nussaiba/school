import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class SubjectsData {
  Crud crud;
  SubjectsData(this.crud);

  getAllSubjectsData(String roomId, String studentId) async {
        print("=============================getAllSubjectsData====================================");

    print("${AppLink.subjects}/$roomId/$studentId");
    var response = await crud.getData("${AppLink.subjects}/$roomId/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
