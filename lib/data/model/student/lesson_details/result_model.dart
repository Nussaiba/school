import 'dart:convert';

import 'package:school/data/model/q_a_model.dart';

class TestResult {
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
  final int? medal;
  final DateTime endTime;
  final String? termId;
  final DateTime createdAt;
  final DateTime updatedAt;

  TestResult({
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

  String toJson() => json.encode(toMap());
  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      id: json['id'],
      classId: json['class_id'],
      roomId: json['room_id'],
      examId: json['exam_id'],
      userId: json['user_id'],
      lessonId: json['lesson_id'],
      selectedQuestions: json['selected_ques'] != null
          ? Map<String, String>.from(jsonDecode(json['selected_ques']))
          : null,
      // userAnswers: Map<String, List<String>>.from(
      //     jsonDecode(json['user_answers'])
      //         .map((key, value) => MapEntry(key, List<String>.from(value)))),

      userAnswers: Map<String, List<String>>.from(
          jsonDecode(json['user_answers']).map((key, value) => MapEntry(
              key, value is String ? [value] : List<String>.from(value)))),
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
  final int id;
  final int lessonId;
  final int teacherId;
  final int roomId;
  final int termId;
  final String? video;
  final String? typeVideo;
  final String? quize;
  final String? test;
  final String? exam;
  final String? addition;
  final String type;
  final String typeFile;
  final String? extension;
  final String startTime;
  final String endTime;
  final String? nameHomework;
  final String? homeworkLink;
  final String? nameQuize;
  final String? nameExam;
  final String? nameAudio;
  final String? audioLink;
  final String? audioFile;
  final String? nameVideo;
  final String? nameAddition;
  final String? additionLink;
  final String? typeVoice;
  final int lectureId;
  final String isGlobal;
  final String period;
  final String note;
  final int successMark;
  final int examStatus;
  final int classId;
  final Map<String, String> selectedQues;
  final int hasTraditional;
  final String? testLink;
  final String? videoLink;
  final String? quizLink;
  final String? examLink;
  final String nameQuize1;
  final String? quizLink1;
  final String? quize1;
  final String? coorId;
  final String? key;
  final DateTime createdAt;
  final DateTime updatedAt;

  Exam({
    required this.id,
    required this.lessonId,
    required this.teacherId,
    required this.roomId,
    required this.termId,
    this.video,
    this.typeVideo,
    this.quize,
    this.test,
    this.exam,
    this.addition,
    required this.type,
    required this.typeFile,
    this.extension,
    required this.startTime,
    required this.endTime,
    this.nameHomework,
    this.homeworkLink,
    this.nameQuize,
    this.nameExam,
    this.nameAudio,
    this.audioLink,
    this.audioFile,
    this.nameVideo,
    this.nameAddition,
    this.additionLink,
    this.typeVoice,
    required this.lectureId,
    required this.isGlobal,
    required this.period,
    required this.note,
    required this.successMark,
    required this.examStatus,
    required this.classId,
    required this.selectedQues,
    required this.hasTraditional,
    this.testLink,
    this.videoLink,
    this.quizLink,
    this.examLink,
    required this.nameQuize1,
    this.quizLink1,
    this.quize1,
    this.coorId,
    this.key,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      lessonId: json['lesson_id'],
      teacherId: json['teacher_id'],
      roomId: json['room_id'],
      termId: json['term_id'],
      video: json['video'],
      typeVideo: json['type_video'],
      quize: json['quize'],
      test: json['test'],
      exam: json['exam'],
      addition: json['addition'],
      type: json['type'],
      typeFile: json['type_file'],
      extension: json['extension'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      nameHomework: json['namehomework'],
      homeworkLink: json['homework_link'],
      nameQuize: json['name_quize'],
      nameExam: json['name_exam'],
      nameAudio: json['name_audio'],
      audioLink: json['audio_link'],
      audioFile: json['audio_file'],
      nameVideo: json['name_video'],
      nameAddition: json['name_addition'],
      additionLink: json['addition_link'],
      typeVoice: json['type_voice'],
      lectureId: json['lecture_id'],
      isGlobal: json['is_global'],
      period: json['period'],
      note: json['note'],
      successMark: json['success_mark'],
      examStatus: json['exam_status'],
      classId: json['class_id'],
      selectedQues: Map<String, String>.from(jsonDecode(json['selected_ques'])),
      hasTraditional: json['has_traditional'],
      testLink: json['test_link'],
      videoLink: json['video_link'],
      quizLink: json['quiz_link'],
      examLink: json['exam_link'],
      nameQuize1: json['name_quize1'],
      quizLink1: json['quiz_link1'],
      quize1: json['quize1'],
      coorId: json['coor_id'],
      key: json['key'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class TestResultModel {
  List<Question?>? questions;
  Exam? exam;
  TestResult? examResult;
  int? contentId;
  String? lessonName;
  String? roomName;
  String? termName;
  int? examPeriod;
  int? studentResult;
  String? year;
  String? city;
  int? status;

  TestResultModel({
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

  factory TestResultModel.fromJson(Map<String, dynamic> json) {
    return TestResultModel(
      questions: json['questions']
          ?.map<Question?>((q) => q != null ? Question.fromJson(q) : null)
          .toList(),
      exam: json['exam'] != null ? Exam.fromJson(json['exam']) : null,
      examResult: json['exam_result'] != null
          ? TestResult.fromJson(json['exam_result'])
          : null,
      contentId: json['content_id'],
      lessonName: json['lesson_name'],
      roomName: json['room_name'],
      termName: json['term_name'],
      examPeriod: jsonDecode(json['exam_period']),
      studentResult: json['student_result'],
      year: json['year'],
      city: json['city'],
      status: json['status'],
    );
  }
}
