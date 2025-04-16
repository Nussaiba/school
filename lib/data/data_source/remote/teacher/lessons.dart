import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class TeacherLessonsData {
  Crud crud;
  TeacherLessonsData(this.crud);

  getAllLessonsData(int subjectid,String roomId, String teachertId ) async {
    print(
        "============================================teacherLessons=================================================");
    print("${AppLink.teacherLessons}/$subjectid/$roomId/$roomId");
    var response =
        await crud.getData("${AppLink.teacherLessons}/$subjectid/$roomId/$teachertId");
    return response.fold((l) => l, (r) => r);
  }

  addNewLessonData(
      String? teacherId, String? roomId, String? lessonId, String? name) async {
    print(
        "-----------***************--------addLesson---------***************************---------");
    print(AppLink.addLesson);
    print("{$teacherId $roomId $lessonId $name}");

    var response = await crud.postData(
      AppLink.addLesson,
      {
        "teacher_id": teacherId,
        "room_id": roomId,
        "lesson_id": lessonId,
        "name": name
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
