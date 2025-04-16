import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class MedalsData {
  Crud crud;
  MedalsData(this.crud);

  getAllMedalsData(String studentId) async {
    print("${AppLink.medals}/$studentId");
    var response = await crud.getData("${AppLink.medals}/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
