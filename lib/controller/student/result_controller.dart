import 'package:get/get.dart';

import '../../data/model/result_model.dart';

class ResultController extends GetxController {
  List<ResultModel> results = [
    ResultModel(
      subjectName: "الرياضيات",
      totalMarks: 100,
      obtainedMarks: 85,
      grade: "B",
    ),
    ResultModel(
      subjectName: "العلوم",
      totalMarks: 100,
      obtainedMarks: 90,
      grade: "A",
    ),
    ResultModel(
      subjectName: "اللغة العربية",
      totalMarks: 100,
      obtainedMarks: 75,
      grade: "C",
    ),
    ResultModel(
      subjectName: "التاريخ",
      totalMarks: 100,
      obtainedMarks: 70,
      grade: "C",
    ),
    ResultModel(
      subjectName: "اللغة الإنجليزية",
      totalMarks: 100,
      obtainedMarks: 80,
      grade: "B",
    ),
    ResultModel(
      subjectName: "الجغرافيا",
      totalMarks: 100,
      obtainedMarks: 88,
      grade: "B",
    ),
    ResultModel(
      subjectName: "التربية الإسلامية",
      totalMarks: 100,
      obtainedMarks: 95,
      grade: "A",
    ),
    ResultModel(
      subjectName: "الفنون",
      totalMarks: 100,
      obtainedMarks: 65,
      grade: "D",
    ),
    ResultModel(
      subjectName: "البدنية",
      totalMarks: 100,
      obtainedMarks: 92,
      grade: "A",
    ),
    ResultModel(
      subjectName: "الفيزياء",
      totalMarks: 100,
      obtainedMarks: 78,
      grade: "B",
    ),
  ];
}
