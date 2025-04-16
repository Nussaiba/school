import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class RoomsData {
  Crud crud;
  RoomsData(this.crud);

  getAllRoomsData(String classId, String teacherId) async {
    var response = await crud.getData("${AppLink.rooms}/$classId/$teacherId");
    print("_____________________________________________________________");
    print("${AppLink.rooms}/$classId/$teacherId");
    return response.fold((l) => l, (r) => r);
  }
}
