import 'dart:convert';

import 'package:school/data/model/lessons_model.dart';

class TestModel {
  int id;
  int lessonId;
  int teacherId;
  int roomId;
  int termId;
  String? video;
  String? typeVideo;
  String? quiz;
  String? test;
  String? exam;
  String? addition;
  String type;
  String? typeFile;
  String? extension;
  String? startTime;
  String? endTime;
  String? nameHomework;
  String? homeworkLink;
  String? nameQuiz;
  String? nameExam;
  String? nameAudio;
  String? audioLink;
  String? audioFile;
  String? nameVideo;
  String? nameAddition;
  String? additionLink;
  int? typeVoice;
  int lectureId;
  String isGlobal;
  String? period;
  String? note;
  int? successMark;
  int? examStatus;
  int? classId;
  Map<String, String>?
      selectedQuestions; // Assuming selected_ques is a JSON string
  int? hasTraditional;
  String? testLink;
  String? videoLink;
  String? quizLink;
  String? examLink;
  String? nameQuiz1;
  String? quizLink1;
  String? quiz1;
  String? coorId;
  String? key;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? notTerminate;
  String? status;
  final Lesson? lesson;

  TestModel({
    required this.id,
    required this.lessonId,
    required this.teacherId,
    required this.roomId,
    required this.termId,
    this.video,
    this.typeVideo,
    this.quiz,
    this.test,
    this.exam,
    this.addition,
    required this.type,
    this.typeFile,
    this.extension,
    this.startTime,
    this.endTime,
    this.nameHomework,
    this.homeworkLink,
    this.nameQuiz,
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
    this.period,
    this.note,
    this.successMark,
    this.examStatus,
    this.classId,
    this.selectedQuestions,
    this.hasTraditional,
    this.testLink,
    this.videoLink,
    this.quizLink,
    this.examLink,
    this.nameQuiz1,
    this.quizLink1,
    this.quiz1,
    this.coorId,
    this.key,
    this.createdAt,
    this.updatedAt,
    this.notTerminate,
    this.status,
    this.lesson,
  });
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['id'],
      lessonId: json['lesson_id'],
      teacherId: json['teacher_id'],
      roomId: json['room_id'],
      termId: json['term_id'],
      video: json['video'],
      typeVideo: json['type_video'],
      quiz: json['quize'],
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
      nameQuiz: json['name_quize'],
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
      selectedQuestions: json['selected_ques'] != null
          ? Map<String, String>.from(jsonDecode(json['selected_ques']))
          : null,
      hasTraditional: json['has_traditional'],
      testLink: json['test_link'],
      videoLink: json['video_link'],
      quizLink: json['quiz_link'],
      examLink: json['exam_link'],
      nameQuiz1: json['name_quize1'],
      quizLink1: json['quiz_link1'],
      quiz1: json['quize1'],
      coorId: json['coor_id'],
      key: json['key'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      notTerminate: json['not_terminate'],
      status: json['status'],
      lesson: json['lesson'] != null ? Lesson.fromJson(json['lesson']) : null,
    );
  }
}
