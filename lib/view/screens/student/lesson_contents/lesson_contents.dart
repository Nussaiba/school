import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/lesson_content/lesson_details_controller.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/screens/student/lesson_contents/assignments_screen.dart';
import 'package:school/view/screens/student/lesson_contents/test/lesson_test.dart';
import 'package:school/view/screens/student/lesson_contents/lesson_video.dart';
import 'package:school/view/screens/student/lesson_contents/lesson_voice.dart';
import 'package:school/view/screens/student/lesson_contents/lessons_files.dart';

class LessonContents extends StatelessWidget {
  LessonContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LessonDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('محتوى الدرس',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColor.kOtherColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppPadding.kDefaultPadding * 3),
              topRight: Radius.circular(AppPadding.kDefaultPadding * 3),
            )),
        clipBehavior: Clip.antiAlias,
        child: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ButtonsTabBar(
                  backgroundColor: AppColor.ksecondColor,
                  splashColor: AppColor.kTextLightColor,
                  contentPadding: EdgeInsets.all(8),
                  unselectedBorderColor: AppColor.ksecondColor,
                  unselectedLabelStyle:
                      TextStyle(color: Colors.black, fontSize: 14),
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  unselectedDecoration: BoxDecoration(
                    color: AppColor.kOtherColor,
                  ),
                  tabs: [
                    Tab(icon: Icon(Icons.folder), text: 'الملفات'),
                    Tab(icon: Icon(Icons.audiotrack), text: 'الصوتيات'),
                    Tab(icon: Icon(Icons.video_library), text: 'الفيديوهات'),
                    Tab(icon: Icon(Icons.assignment), text: 'الوظائف'),
                    Tab(
                        icon: Icon(Icons.assignment_turned_in),
                        text: 'الاختبارات'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    LessonFilesGrid(),
                    LessonVoice(),
                    LessonVideo(),
                    LessonAssignments(),
                    LessonTest(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
