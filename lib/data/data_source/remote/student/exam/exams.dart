import 'dart:io';

import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class ExamsData {
  Crud crud;
  ExamsData(this.crud);

  getAllExamsData(String roomId, String studentId) async {
    var response = await crud.getData("${AppLink.exams}/$roomId/$studentId");
    return response.fold((l) => l, (r) => r);
  }

  sendExamFileData(
    String studentId,
    String itemId,
    File file,
    String extension,
  ) async {
        print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

    print("${AppLink.sendExamFile}");
        print("=====$studentId====$itemId======$file=========$extension===========");
        print("=====$extension=========$file===============");

    var response = await crud.postFileAndData(
        AppLink.sendExamFile,
        {
          "student_id": studentId,
          "item_id": itemId,
          "file[0]": file,
          "extension": extension,
        },
          "file[0]",
   file
        );
    return response.fold((l) => l, (r) => r);
  }
}
