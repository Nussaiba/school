import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class GraduateData {
  Crud crud;
  GraduateData(this.crud);

  getAllGraduateData(String studentId, String roomId) async {
    var response = await crud.getData("${AppLink.graduate}/$studentId/$roomId");
    return response.fold((l) => l, (r) => r);
  }
}
