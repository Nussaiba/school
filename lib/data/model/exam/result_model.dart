import 'dart:convert';

import 'package:school/data/model/q_a_model.dart';

class ExamResult {
  final int id;
  final int classId;
  final int roomId;
  final int examId;
  final int userId;
  final int lessonId;
  final Map<String, String>? selectedQuestions;
  final Map<String, List<String>> userAnswers;
  final String result;
  final int showResult;
  final String? traditionalResult;
  final String type;
  final String status;
  final DateTime startTime;
  final String? medal;
  final DateTime endTime;
  final String? termId;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Constructor
  ExamResult({
    required this.id,
    required this.classId,
    required this.roomId,
    required this.examId,
    required this.userId,
    required this.lessonId,
    this.selectedQuestions,
    required this.userAnswers,
    required this.result,
    required this.showResult,
    this.traditionalResult,
    required this.type,
    required this.status,
    required this.startTime,
    this.medal,
    required this.endTime,
    this.termId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'class_id': classId,
      'room_id': roomId,
      'exam_id': examId,
      'user_id': userId,
      'lesson_id': lessonId,
      'selected_ques':
          selectedQuestions != null ? json.encode(selectedQuestions) : null,
      'user_answers': userAnswers != null ? json.encode(userAnswers) : null,
      'result': result,
      'show_result': showResult,
      'traditional_result': traditionalResult,
      'type': type,
      'status': status,
      'start_time': startTime.toIso8601String(),
      'medal': medal,
      'end_time': endTime.toIso8601String(),
      'term_id': termId,
      'Created_at': createdAt.toIso8601String(),
      'Updated_at': updatedAt.toIso8601String(),
    };
  }

  // دالة لتحويل النموذج إلى JSON
  String toJson() => json.encode(toMap());
  factory ExamResult.fromJson(Map<String, dynamic> json) {
    return ExamResult(
      id: json['id'],
      classId: json['class_id'],
      roomId: json['room_id'],
      examId: json['exam_id'],
      userId: json['user_id'],
      lessonId: json['lesson_id'],
      selectedQuestions: json['selected_ques'] != null
          ? Map<String, String>.from(jsonDecode(json['selected_ques']))
          : null,

      userAnswers: Map<String, List<String>>.from(
          jsonDecode(
            json['user_answers'])
              .map((key, value) => MapEntry(key, 

               value is String ? [value]
     :
      
              List<String>.from(value))
              
              )
              ),
      result: json['result'],
      showResult: json['show_result'],
      traditionalResult: json['traditional_result'],
      type: json['type'],
      status: json['status'],
      startTime: DateTime.parse(json['start_time']),
      medal: json['medal'],
      endTime: DateTime.parse(json['end_time']),
      termId: json['term_id'],
      createdAt: DateTime.parse(json['Created_at']),
      updatedAt: DateTime.parse(json['Updated_at']),
    );
  }
}

class Exam {
  int? id;
  int? userId;
  int? classId;
  int? roomId;
  int? lessonId;
  int? termId;
  int? type;
  int? isTaken;
  int? isFile;
  String? name;
  int? questionPicker;
  String? selectedQues;
  int? hasTradional;
  dynamic file;
  String? required;
  int? period;
  int? mark;
  String? startDate;
  String? endDate;
  int? groupe;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  Exam({
    this.id,
    this.userId,
    this.classId,
    this.roomId,
    this.lessonId,
    this.termId,
    this.type,
    this.isTaken,
    this.isFile,
    this.name,
    this.questionPicker,
    this.selectedQues,
    this.hasTradional,
    this.file,
    this.required,
    this.period,
    this.mark,
    this.startDate,
    this.endDate,
    this.groupe,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      userId: json['user_id'],
      classId: json['class_id'],
      roomId: json['room_id'],
      lessonId: json['lesson_id'],
      termId: json['term_id'],
      type: json['type'],
      isTaken: json['is_taken'],
      isFile: json['is_file'],
      name: json['name'],
      questionPicker: json['question_picker'],
      selectedQues: json['selected_ques'],
      hasTradional: json['has_traditional'],
      file: json['file'],
      required: json['required'],
      period: json['period'],
      mark: json['mark'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      groupe: json['groupe'],
      notes: json['notes'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}

class ExamResultModel {
  List<Question?>? questions;
  Exam? exam;
  ExamResult? examResult;
  int? contentId;
  String? lessonName;
  String? roomName;
  String? termName;
  int? examPeriod;
  int? studentResult;
  String? year;
  String? city;
  int? status;

  ExamResultModel({
    this.questions,
    this.exam,
    this.examResult,
    this.contentId,
    this.lessonName,
    this.roomName,
    this.termName,
    this.examPeriod,
    this.studentResult,
    this.year,
    this.city,
    this.status,
  });

  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      questions: json['questions']
          ?.map<Question?>((q) => q != null ? Question.fromJson(q) : null)
          .toList(),
      exam: json['exam'] != null ? Exam.fromJson(json['exam']) : null,
      examResult: json['exam_result'] != null
          ? ExamResult.fromJson(json['exam_result'])
          : null,
      contentId: json['content_id'],
      lessonName: json['lesson_name'],
      roomName: json['room_name'],
      termName: json['term_name'],
      examPeriod: json['exam_period'],
      studentResult: json['student_result'],
      year: json['year'],
      city: json['city'],
      status: json['status'],
    );
  }
}
