import 'dart:convert';

import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class SubmitData {
  Crud crud;
  SubmitData(this.crud);

  submitpostdata(String studentId, String contentId, List answer) async {
    print(
        "lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
    print(AppLink.submitexam);
        print(studentId);
    print(contentId);
    print( json.encode(answer));

    print(json.encode(answer));

    var response = await crud.postData(AppLink.submitexam, {
      "student_id": studentId,
      "content_id": contentId,
      "answer": json.encode(answer)
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
