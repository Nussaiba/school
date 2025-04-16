import 'package:get/get.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/teacher/rooms.dart';
import 'package:school/data/model/teacher/class_model.dart';
import 'package:school/data/model/teacher/room_model.dart';

class RoomsController extends GetxController {
  RoomsData roomsData = RoomsData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List dataRooms = [];
  List<RoomModel> roomsList = [];
  late String teacherId;
  late ClassModel classModel;
  getRooms() async {
    dataRooms.clear();
    roomsList.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await roomsData.getAllRoomsData(classModel.id.toString(),teacherId);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataRooms.length}lllllllmmmmmmmmmmlllll");
      dataRooms.addAll(response['rooms']);
    
      for (int i = 0; i < dataRooms.length; i++) {
        roomsList.add(
          RoomModel.fromJson(dataRooms[i]),
        );
      }
      update();
   
    }
  }

  @override
  void onInit() {
    teacherId = myServices.box.read("teacher_id");
    classModel = Get.arguments['classModel'];
        print(    "=======================================teacherId==========================================");

    print(    teacherId);
            print(    "=======================================classId==========================================");

        print(    classModel.id);
    getRooms();

    super.onInit();
  }
}
