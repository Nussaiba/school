import 'package:school/data/model/lessons_model.dart';

class ExamModel {
  final int? id;
  final int? userId;
  final int? classId;
  final int? roomId;
  final int? lessonId;
  final int? termId;
  final int? type;
  final int? isTaken;
  final int? isFile;
  final String? name;
  final int? questionPicker;
  final String? selectedQues;
  final int? hasTraditional;
  final String? file;
  final String? required;
  final int? period;
  final int? mark;
  final String? startDate;
  final String? endDate;
  final int? groupe;
  final String? notes;
  final String? createdAt;
  final String? updatedAt;
  final int? day;
  final String? totalPeriod;
  final int? previousFile;
  final int? previousFilesCount;
  final String? notTerminate;
  final String? result;
  final int? startExam;
  final Lesson? lesson;

  ExamModel({
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
    this.hasTraditional,
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
    this.day,
    this.totalPeriod,
    this.previousFile,
    this.previousFilesCount,
    this.notTerminate,
    this.result,
    this.startExam,
    this.lesson,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
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
      hasTraditional: json['has_traditional'],
      file: json['file'],
      required: json['required'],
      period: json['period'],
      mark: json['mark'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      groupe: json['groupe'],
      notes: json['notes'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      day: json['day'],
      totalPeriod: json['total_period'],
      previousFile: json['previous_file'],
      previousFilesCount: json['previous_files_count'],
      notTerminate: json['not_terminate'],
      result: json['result'],
      startExam: json['start_exam'],
      lesson: json['lesson'] != null ? Lesson.fromJson(json['lesson']) : null,
    );
  }
}
