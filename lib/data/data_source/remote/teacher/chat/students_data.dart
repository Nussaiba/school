import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class TeacherChatData {
  Crud crud;
  TeacherChatData(this.crud);
  getAllStudents(String roomId) async {
    var response = await crud.getData("${AppLink.getAllStudents}/$roomId");
    print("-----------------------------------------------------------------");
    print("${AppLink.getAllStudents}/$roomId");
    return response.fold((l) => l, (r) => r);
  }

  getAllStudentsData(String teacherId) async {
    var response = await crud.getData("${AppLink.getStudents}/$teacherId");
    return response.fold((l) => l, (r) => r);
  }

  getAllStudentsMessagesData(
    String teacherId,
    String studentId,
  ) async {
    var response = await crud
        .getData("${AppLink.getStudentsMessages}/$teacherId/$studentId");
    return response.fold((l) => l, (r) => r);
  }

  sendMessagePost(String studentId, String teacherId, String message) async {
    var response = await crud.postData(AppLink.sendTeacherMessage, {
      "student_id": studentId,
      "teacher_id": teacherId,
      "message": message,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  sendGroupMessagePost(String roomId, String teacherId, String message) async {
    print("-------------------------------------");
    print(AppLink.sendGroupMessage);
    print("------$teacherId--------------$roomId----------$message-------");

    var response = await crud.postData(AppLink.sendGroupMessage, {
      "teacher_id": teacherId,
      "room_id": roomId,
      "message": message,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }




  sendAdminMessagePost( String teacherId, String message) async {
    print("-------------------------------------");
    print(AppLink.sendAdminMessage);
    print("------$teacherId------------------------$message-------");

    var response = await crud.postData(AppLink.sendAdminMessage, {
      "teacher_id": teacherId,
      "message": message,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }




   getAllAdminMessages(String teacherId) async {
    var response = await crud.getData("${AppLink.getAdminMessage}/$teacherId");
    print("------------------------------getAdminMessage-----------------------------------");
    print("${AppLink.getAdminMessage}/$teacherId");
    return response.fold((l) => l, (r) => r);
  }

}
