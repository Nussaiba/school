class ResultModel {
  String? subjectName;
  int? totalMarks;
  int? obtainedMarks;
  String? grade;

  ResultModel({
    this.subjectName,
    this.totalMarks,
    this.obtainedMarks,
    this.grade,
  });
  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel();
}
