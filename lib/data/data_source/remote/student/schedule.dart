import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class ScheduleData {
  Crud crud;
  ScheduleData(this.crud);

  getScheduleData(String roomId , String studentId) async {
    var response = await crud.getData(
        "${AppLink.schedule}/$roomId/$studentId/${DateTime.now().timeZoneOffset.inMinutes}");
    return response.fold((l) => l, (r) => r);
  }

  setAttendanceStudentData(
     int schedulerId,int dayId,int lectureTimeId, room_id, studentId) async {
    var response = await crud.getData(
        "${AppLink.setAttendanceStudent}/$schedulerId/$dayId/$lectureTimeId/$room_id/$studentId");
    print(
        "___________________________________________________________________________________________________________");
    print(
        "${AppLink.setAttendanceStudent}/$schedulerId/$dayId/$lectureTimeId/$room_id/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
