import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class ClassesData {
  Crud crud;
  ClassesData(this.crud);

  getAllClasseData(String teacherId) async {
    var response = await crud.getData("${AppLink.classes}/$teacherId");
    return response.fold((l) => l, (r) => r);
  }
}
