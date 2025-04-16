import 'dart:convert';

import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class LessonDetailsData {
  Crud crud;
  LessonDetailsData(this.crud);

  getLessonDetailsData(String roomId, String lessonId, String studentId,
      String lessonId2, String argument) async {
    var response = await crud.getData(
        "${AppLink.studentLessonDetails}/$roomId/$lessonId/$studentId/$lessonId2/$argument");
    print("-------------------------------------------------------------");
    print(
        "${AppLink.studentLessonDetails}/$roomId/$lessonId/$studentId/$lessonId2/$argument");
    return response.fold((l) => l, (r) => r);
  }

  getStartExamsData(String examId, String studentId) async {
    var response =
        await crud.getData("${AppLink.startTest}/$examId/$studentId");
    return response.fold((l) => l, (r) => r);
  }

  submitpostdata(String studentId, String contentId, List answer) async {
    print("llllllllllllllllllllll");

    print(json.encode(answer));

    var response = await crud.postData(AppLink.submitTest, {
      "student_id": studentId,
      "content_id": contentId,
      "answer": json.encode(answer)
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  getExamResultData(String examId, String studentId) async {
    var response = await crud.getData("${AppLink.showTest}/$examId/$studentId");
    print(
        "-----------------------------------------------------------------------");
    print("${AppLink.showTest}/$examId/$studentId");
    return response.fold((l) => l, (r) => r);
  }
}
