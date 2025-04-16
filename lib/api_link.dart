import 'package:get/get.dart';

class AppLink {
  static const String serverimage = "https://ssvs.mysunriseit.com/storage/";

  static const String server = "https://ssvs.mysunriseit.com/api";

  //auth Link ***********************
  static const String login = "$server/get_login_student_info";
  // get subjects
  static const String subjects = "$server/get_student_subjects";
  // get lessons
  static const String lessons = "$server/get_student_lessons";
  //get events
  static const String events = "$server/dashboard/student/events";
  //exam
//get exams
  static const String exams = "$server/dashboard/student/main_exam";
//satrt
  static const String startexam = "$server/dashboard/student/main_exam/start";
  static const String submitexam = "$server/dashboard/student/main_exam/submit";
  static const String viewexam = "$server/dashboard/student/exam/view_test";
  static const String sendExamFile =
      "$server/dashboard/student/upload_exam_files2";
//quiz
  static const String quiz = "$server/dashboard/student/main_quize";

  //schedule
  static const String schedule = "$server/dashboard/student/schedule";
  static const String setAttendanceStudent = "$server/go_to_stream_student";

//get_student_lesson_details
  static const String studentLessonDetails =
      "$server/get_student_lesson_details";

  static const String startTest = "$server/dashboard/student/exam_test/start";
  static const String submitTest = "$server/dashboard/student/exam_test/submit";
  static const String showTest = "$server/dashboard/student/view_quize";
//graduate
  static const String graduate = "$server/dashboard/student/graduate";

  //medals
  static const String medals = "$server/dashboard/student/medals";

// get_certificate
  static const String getCertificate =
      "$server/dashboard/student/get_certificate";

//chat
  static const String getTeachers = "$server/dashboard/student/messages";
  static const String getTeachersMessages =
      "$server/dashboard/student/messages/get_teacher_message";
  static const String sendMessage =
      "$server/dashboard/student/messages/store_message";

//teacher api
//all Students
  static const String getAllStudents = "$server/get_room_student";

//chat
  static const String getStudents = "$server/get_message";
  static const String getStudentsMessages = "$server/get_message_student";
  static const String sendTeacherMessage =
      "$server/dashboard/teacher/send_message";
  static const String sendGroupMessage =
      "$server/dashboard/teacher/send_group_message";
  static const String sendAdminMessage = "$server/admin/store_admin_message";
  static const String getAdminMessage = "$server/admin/get_admin_message";

//classes
  static const String classes = "$server/teacher_classes";
//rooms
  static const String rooms = "$server/teacher_rooms";
  //subjects
  static const String teacherSubjects = "$server/teacher_subjects";
//lesson

  static const String teacherLessons = "$server/teacher_lessons";
  static const String lessonDetailTeacher =
      "$server/get_teacher_lesson_details";
// addLessonContain
  static const String addLessonContain = "$server/teacher/store/items";
// addLessonn
  static const String addLesson = "$server/teacher/store/lecture";

  static const String teacherSchedule = "$server/teacher_schedule";
}
