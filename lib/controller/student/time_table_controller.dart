
// import 'package:get/get.dart';

// // class Lesson {
// //   final String name;
// //   final String? teacher;
// //   final String time;

// //   Lesson({
// //     required this.name,
// //     required this.teacher,
// //     required this.time,
// //   });
// // }

// // class ScheduleController extends GetxController {
// //   final List<List<Lesson>> schedule = [
// //     // السبت
// //     [
// //       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45"),
// //       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45"),
// //       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30"),
// //       Lesson(
// //           name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30"),
// //       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15"),
// //       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00"),
// //     ],
// //     // الأحد
// //     [
// //       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45"),
// //       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45"),
// //       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30"),
// //       Lesson(
// //           name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30"),
// //       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15"),
// //       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00"),
// //     ],
// //     [
// //       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45"),
// //       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45"),
// //       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30"),
// //       Lesson(
// //           name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30"),
// //       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15"),
// //       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00"),
// //     ],
// //     [
// //       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45"),
// //       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45"),
// //       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30"),
// //       Lesson(
// //           name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30"),
// //       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15"),
// //       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00"),
// //     ],
// //     [
// //       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45"),
// //       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45"),
// //       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30"),
// //       Lesson(
// //           name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30"),
// //       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15"),
// //       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00"),
// //     ],
// //     [
// //       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45"),
// //       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45"),
// //       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30"),
// //       Lesson(
// //           name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15"),
// //       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30"),
// //       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15"),
// //       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00"),
// //     ],
// //   ];


// class Lesson {
//   final String name;
//   final String? teacher;
//   final String time;
//   final String period; // إضافة رقم الحصة

//   Lesson({
//     required this.name,
//     required this.teacher,
//     required this.time,
//     required this.period, // إضافة رقم الحصة في المُنشئ
//   });
// }

// class ScheduleController extends GetxController {
//   final List<List<Lesson>> schedule = [
//     // السبت
//     [
//       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45", period: "الحصة الأولى"),
//       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30", period: "الحصة الثانية"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45", period: "استراحة"),
//       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30", period: "الحصة الرابعة"),
//       Lesson(name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15", period: "الحصة الخامسة"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30", period: "استراحة"),
//       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15", period: "الحصة السادسة"),
//       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00", period: "الحصة السابعة"),
//     ],
//     // الأحد
//     [
//       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45", period: "الحصة الأولى"),
//       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30", period: "الحصة الثانية"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45", period: "استراحة"),
//       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30", period: "الحصة الرابعة"),
//       Lesson(name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15", period: "الحصة الخامسة"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30", period: "استراحة"),
//       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15", period: "الحصة السادسة"),
//       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00", period: "الحصة السابعة"),
//     ],
//      [
//       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45", period: "الحصة الأولى"),
//       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30", period: "الحصة الثانية"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45", period: "استراحة"),
//       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30", period: "الحصة الرابعة"),
//       Lesson(name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15", period: "الحصة الخامسة"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30", period: "استراحة"),
//       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15", period: "الحصة السادسة"),
//       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00", period: "الحصة السابعة"),
//     ], [
//       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45", period: "الحصة الأولى"),
//       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30", period: "الحصة الثانية"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45", period: "استراحة"),
//       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30", period: "الحصة الرابعة"),
//       Lesson(name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15", period: "الحصة الخامسة"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30", period: "استراحة"),
//       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15", period: "الحصة السادسة"),
//       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00", period: "الحصة السابعة"),
//     ], [
//       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45", period: "الحصة الأولى"),
//       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30", period: "الحصة الثانية"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45", period: "استراحة"),
//       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30", period: "الحصة الرابعة"),
//       Lesson(name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15", period: "الحصة الخامسة"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30", period: "استراحة"),
//       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15", period: "الحصة السادسة"),
//       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00", period: "الحصة السابعة"),
//     ], [
//       Lesson(name: "الرياضيات", teacher: "أ. علي", time: "8:00-8:45", period: "الحصة :الأولى"),
//       Lesson(name: "اللغة العربية", teacher: "أ. فاطمة", time: "8:45-9:30", period: "الحصة :الثانية"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "9:30-9:45", period: "استراحة"),
//       Lesson(name: "العلوم", teacher: "أ. سعيد", time: "9:45-10:30", period: "الحصة :الرابعة"),
//       Lesson(name: "التربية الإسلامية", teacher: "أ. عائشة", time: "10:30-11:15", period: "الحصة :الخامسة"),
//       Lesson(name: "استراحة", teacher: "لا يوجد", time: "11:15-11:30", period: "استراحة"),
//       Lesson(name: "التاريخ", teacher: "أ. حسن", time: "11:30-12:15", period: "الحصة :السادسة"),
//       Lesson(name: "الجغرافيا", teacher: "أ. ليلى", time: "12:30-1:00", period: "الحصة : السابعة"),
//     ],
//   ];


//   List<String> days = [
//     "السبت",
//     "الأحد",
//     "الإثنين",
//     "الثلاثاء",
//     "الأربعاء",
//     "الخميس"
//   ];
// }