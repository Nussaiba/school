import 'package:get/get.dart';
import 'package:school/core/constants/app_routes.dart';
import 'package:school/core/middleware/mymiddleware.dart';
import 'package:school/view/screens/student/certificate_screen.dart';
import 'package:school/view/screens/student/chat/chat_screen.dart';
import 'package:school/view/screens/student/exam/exam_questions.dart';
import 'package:school/view/screens/student/exam/exam_result.dart';
import 'package:school/view/screens/student/exam/exams_screen.dart';
import 'package:school/view/screens/student/graduate_screen.dart';
import 'package:school/view/screens/student/lesson_contents/assignments_screen.dart';
import 'package:school/view/screens/student/home_screen.dart';
import 'package:school/view/screens/student/lesson_contents/test/test_questions.dart';
import 'package:school/view/screens/student/lesson_contents/test/test_result_screen.dart';
import 'package:school/view/screens/student/lessons_screen.dart';
import 'package:school/view/screens/login_screen.dart';
import 'package:school/view/screens/student/chat/teachers_screen.dart';
import 'package:school/view/screens/student/medals.dart';
import 'package:school/view/screens/student/profile_screen.dart';
import 'package:school/view/screens/student/quiz/quiz_screen.dart';
import 'package:school/view/screens/splash_screen.dart';
import 'package:school/view/screens/student/subjects_page.dart';
import 'package:school/view/screens/teacher_screen/chat/chat_screen.dart';
import 'package:school/view/screens/teacher_screen/chat/send_multi_message_page.dart';
import 'package:school/view/screens/teacher_screen/chat/send_single_message_page.dart';
import 'package:school/view/screens/teacher_screen/chat/students_screen.dart';
import 'package:school/view/screens/teacher_screen/classes_teacher_screen.dart';
import 'package:school/view/screens/teacher_screen/home_teacher_screen.dart';
import 'package:school/view/screens/teacher_screen/teacher_lessons_screen.dart';
import 'package:school/view/screens/teacher_screen/time_table_teacher_screen.dart';
import 'package:school/view/screens/student/time_table.dart';


List<GetPage<dynamic>>? routes = [
  //splash
  GetPage(
      name: "/splash",
      page: () => const SplashScreen(),
      middlewares: [MyMiddleWare()]),
  // GetPage(name: AppRoute.splash, page: () => SplashScreen()),
  GetPage(name: AppRoute.loginScreen, page: () => LoginScreen()),
  GetPage(name: AppRoute.homeScreen, page: () => HomeScreen()),
  GetPage(name: AppRoute.result, page: () => GraduateScreen()),
  GetPage(name: AppRoute.assignmentsScreen, page: () => LessonAssignments()),
  GetPage(name: AppRoute.messagesScreen, page: () => MessagesScreen()),
  GetPage(name: AppRoute.certificateScreen, page: () => CertificateScreen()),
  GetPage(name: AppRoute.examScreen, page: () => ExamsScreen()),
  GetPage(name: AppRoute.quizScreen, page: () => QuizPage()),
  GetPage(name: AppRoute.subjectsScreen, page: () => SubjectsPage()),
  GetPage(name: AppRoute.lessonsPage, page: () => LessonsPage()),
  GetPage(name: AppRoute.schedulePage, page: () => SchedulePage()),
  GetPage(name: AppRoute.profileScreen, page: () => ProfileScreen()),
  GetPage(name: AppRoute.chatScreen, page: () => ChatScreen()),
  GetPage(name: AppRoute.examResult, page: () => ExamResultScreen()),
  GetPage(name: AppRoute.startTest, page: () => TestScreen()),
  GetPage(name: AppRoute.resultTest, page: () => TestResultScreen()),
    GetPage(name: AppRoute.quiz, page: () => QuizScreen()),
  GetPage(name: AppRoute.medals, page: () => MedalsScreen()),


  // teacher screen
  GetPage(name: AppRoute.teacherHome, page: () => HomeTeacherScreen()),
  GetPage(name: AppRoute.classesScreen, page: () => ClassesScreen()),
  // GetPage(name: AppRoute.sectionScreen, page: () => SectionsScreen()),
  GetPage(name: AppRoute.teacherLessons, page: () => TeacherLessonsScreen()),
  GetPage(
      name: AppRoute.scheduleTeacherPage, page: () => ScheduleTeacherPage()),
  GetPage(name: AppRoute.teacherChats, page: () => StudentsScreen()),
  GetPage(name: AppRoute.teacherMessages, page: () => TeacherChatScreen()),
  GetPage(name: AppRoute.multiMessage, page: () => SendMultiMessagePage()),
  GetPage(name: AppRoute.singleMessage, page: () => SendSingleMessagePage()),

  
];
