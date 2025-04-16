import 'package:get/get.dart';
import 'package:school/api_link.dart';
import 'package:school/core/class/statusrequest.dart';
import 'package:school/core/functions/handlingdata.dart';
import 'package:school/core/services/services.dart';
import 'package:school/data/data_source/remote/student/lesson_details.dart';
import 'package:school/data/model/lessons_model.dart';
import 'package:school/data/model/model2.dart';
import 'package:school/data/model/student/lesson_details/lesson_details_model.dart';
import 'package:school/data/model/student/lesson_details/test_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LessonDetailsController extends GetxController {
  LessonDetailsData lessonsData = LessonDetailsData(Get.find());

  late StatusRequest statusRequest = StatusRequest.none;
  late String studentId;
  late String roomId;
  late SubjectsModel subjectsModel;
  MyServices myServices = Get.find();
  List dataLessonDetail = [];
  List<LessonDetailsModel> lessonDetailList = [];
  List dataLessonDetailTests = [];
  List<TestModel> lessonDetailListTests = [];
  List dataLessonDetailVideo = [];
  List<LessonDetailsModel> lessonDetailListVideo = [];
  List dataLessonDetailAudio = [];
  List<LessonDetailsModel> lessonDetailListAudio = [];
  List dataLessonDetailHomeWorks = [];
  List<LessonDetailsModel> lessonDetailListHomeWorks = [];
  late Lesson lesson;
  getLessonDetail() async {
    dataLessonDetail.clear();
    lessonDetailList.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getLessonDetailsData(roomId,
        lesson.lessonId.toString(), studentId, lesson.id.toString(), '4');
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataLessonDetail.length}lllllllmmmmmmmmmmlllll");
      subjectsModel = SubjectsModel.fromJson(response['subject']);
      dataLessonDetail.addAll(response['lesson_details']);
      for (int i = 0; i < dataLessonDetail.length; i++) {
        lessonDetailList.add(
          LessonDetailsModel.fromJson(dataLessonDetail[i]),
        );
      }
      update();
    }
  }

  getLessonDetailTests() async {
    dataLessonDetailTests.clear();
    lessonDetailListTests.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getLessonDetailsData(roomId,
        lesson.lessonId.toString(), studentId, lesson.id.toString(), '8');
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataLessonDetailTests.length}lllllllmmmmmmmmmmlllll");
      dataLessonDetailTests.addAll(response['lesson_details']);
      for (int i = 0; i < dataLessonDetailTests.length; i++) {
        lessonDetailListTests.add(
          TestModel.fromJson(dataLessonDetailTests[i]),
        );
      }
      update();
    }
  }

  getLessonDetailVideo() async {
    dataLessonDetailVideo.clear();
    lessonDetailListVideo.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getLessonDetailsData(roomId,
        lesson.lessonId.toString(), studentId, lesson.id.toString(), '0');
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataLessonDetailVideo.length}lllllllmmmmmmmmmmlllll");
      dataLessonDetailVideo.addAll(response['lesson_details']);
      for (int i = 0; i < dataLessonDetailVideo.length; i++) {
        lessonDetailListVideo.add(
          LessonDetailsModel.fromJson(dataLessonDetailVideo[i]),
        );
        print("dassonDetailVideodataLessonDetailVideo");

        print(dataLessonDetailVideo);
      }
      update();
    }
  }

  getLessonDetailAudio() async {
    dataLessonDetailAudio.clear();
    lessonDetailListAudio.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getLessonDetailsData(roomId,
        lesson.lessonId.toString(), studentId, lesson.id.toString(), '6');
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataLessonDetailAudio.length}lllllllmmmmmmmmmmlllll");
      dataLessonDetailAudio.addAll(response['lesson_details']);
      for (int i = 0; i < dataLessonDetailAudio.length; i++) {
        lessonDetailListAudio.add(
          LessonDetailsModel.fromJson(dataLessonDetailAudio[i]),
        );
      }
      update();
    }
  }

  getLessonDetailHomeWorks() async {
    dataLessonDetailHomeWorks.clear();
    lessonDetailListHomeWorks.clear();
    statusRequest = StatusRequest.loading;
    var response = await lessonsData.getLessonDetailsData(roomId,
        lesson.lessonId.toString(), studentId, lesson.id.toString(), '1');
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("${dataLessonDetailHomeWorks.length}lllllllmmmmmmmmmmlllll");
      dataLessonDetailHomeWorks.addAll(response['lesson_details']);
      for (int i = 0; i < dataLessonDetailHomeWorks.length; i++) {
        lessonDetailListHomeWorks.add(
          LessonDetailsModel.fromJson(dataLessonDetailHomeWorks[i]),
        );
        // Get.snackbar("", lessonDetailListHomeWorks[i].test!  );
      }
      update();
    }
  }

  @override
  void onInit() {
    roomId = myServices.box.read("room_id");
    studentId = myServices.box.read("student_id");
    lesson = Get.arguments['lesson'];
    getLessonDetail();
    getLessonDetailTests();
    getLessonDetailVideo();
    getLessonDetailAudio();
    getLessonDetailHomeWorks();
    super.onInit();
  }

  void launchFile(String url) async {
    await launchUrl(
      Uri.parse("${AppLink.serverimage}/$url"),
      mode: LaunchMode.externalApplication,
    );
  }

//    void launchURL(String url) async {
//     if(await canLaunchUrl(Uri.parse(url))) {
//  await launchUrl(
//       Uri.parse("$url"),
//                   mode: LaunchMode.externalApplication,

//     );

//     } else {
//       throw 'Could not launch $url';
//     }
//   }

  void launchURL(String url) async {
    print(url);
    final driveUrl = url.replaceAll('/view?usp=sharing', '/preview');
    print(driveUrl);

    if (await canLaunch(driveUrl)) {
      await launch(driveUrl);
    } else {
      throw 'Could not launch $driveUrl';
    }
  }
}
