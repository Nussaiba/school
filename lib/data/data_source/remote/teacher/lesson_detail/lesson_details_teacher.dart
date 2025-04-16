import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class LessonDetailsTeacherData {
  Crud crud;
  LessonDetailsTeacherData(this.crud);

  getLessonDetailsData(String roomId, String lessonId, String teacherId,
      String lessonId2, String argument) async {
    var response = await crud.getData(
        "${AppLink.lessonDetailTeacher}/$roomId/$lessonId/$teacherId/$lessonId2/$argument");
    print(
        "${AppLink.lessonDetailTeacher}/$roomId/$lessonId/$teacherId/$lessonId2/$argument");
    return response.fold((l) => l, (r) => r);
  }

  addLessonDetailsData(
      String? type,
      String? name,
      String? link,
      String? classId,
      String? roomId,
      String? lessonId,
      String? lectureId,
      String? teacherId,
      String? file,
      String? extension,
      String? anyfileExtension,
      String? startTime,
      String? endTime) async {
    print(
        "-----------***************--------addLessonContain---------***************************---------");
    print(AppLink.addLessonContain);
    print(
        " $type,   $name,  $link,      $classId,   $roomId, $lessonId, $lectureId, $teacherId,  $file,$extension, $anyfileExtension,  $startTime, $endTime");
    var response = await crud.postData(
      AppLink.addLessonContain,
      {
        "type": type,
        "name": name,
        "link": link,
        "class_id": classId,
        "room_id": roomId,
        "lesson_id": lessonId,
        "lecture_id": lectureId,
        "teacher_id": teacherId,
        "file": file,
        "extension": extension,
        "anyfile_extension": anyfileExtension,
        "start_time": startTime,
        "end_time": endTime
      },
    );
    // print("${AppLink.lessonDetailTeacher}/$roomId/$lessonId/$teacherId/$lessonId2/$argument");
    return response.fold((l) => l, (r) => r);
  }
}
