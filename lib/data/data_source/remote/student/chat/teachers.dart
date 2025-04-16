import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class GetTeachersData {
  Crud crud;
  GetTeachersData(this.crud);

  getAllTeachersData(String studentId) async {
    var response = await crud.getData("${AppLink.getTeachers}/$studentId");
    return response.fold((l) => l, (r) => r);
  }

  getAllTeachersMessagesData(String studentId, String teacherId , String type) async {

    var response = await crud.getData("${AppLink.getTeachersMessages}/$studentId/$teacherId/$type");
    return response.fold((l) => l, (r) => r);
  }
  
  sendMessagePost(String studentId , String teacherId,String message ) async {
    
    var response = await crud.postData(AppLink.sendMessage, {
      "student_id": studentId,
      "teacher_id": teacherId,
            "message": message,

    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

}
