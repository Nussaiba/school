import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class ScheduleTeacherData {
  Crud crud;
  ScheduleTeacherData(this.crud);

  getScheduleData(String teacherId) async {
    var response = await crud.getData("${AppLink.teacherSchedule}/$teacherId");
    print("${AppLink.teacherSchedule}/$teacherId");
    return response.fold((l) => l, (r) => r);
  }
}
