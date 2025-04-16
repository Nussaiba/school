import 'dart:convert';

class Question {
  final int? id;
  final String? questionForm;
  final List<String>? answer;
  final int? mark;
  final String? note;
  final int? quesType;
  final int? classId;
  final int? sectionId;
  final int? lectureId;
  final int? lessonId;
  final int? teacherId;
  final int? coordinatorId;
  final int? coorId;
  final int? termId;
  final int? active;
  final int? accept;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Option? option;
  final Section? section;
  final int? studentMark;
  Question({
    this.id,
    this.questionForm,
    this.answer,
    this.mark,
    this.note,
    this.quesType,
    this.classId,
    this.sectionId,
    this.lectureId,
    this.lessonId,
    this.teacherId,
    this.coordinatorId,
    this.coorId,
    this.termId,
    this.active,
    this.accept,
    this.createdAt,
    this.updatedAt,
    this.option,
    this.section,
    this.studentMark
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionForm: json['question_form'],
// answer: json['answer'] != null ? jsonDecode(json['answer']).cast<String>().toList() : null,

      answer: json['answer'] != null
          ? json['answer'].startsWith('[') && json['answer'].endsWith(']')
              ? List<String>.from(jsonDecode(json['answer']))
              : [json['answer'].toString()]
          : null,

      mark: json['mark'],
      note: json['note'],
      quesType: json['ques_type'],
      classId: json['class_id'],
      sectionId: json['section_id'],
      lectureId: json['lecture_id'],
      lessonId: json['lesson_id'],
      teacherId: json['teacher_id'],
      coordinatorId: json['coordinator_id'],
      coorId: json['coor_id'],
      termId: json['term_id'],
      active: json['active'],
      accept: json['accept'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      option: json['option'] != null ? Option.fromJson(json['option']) : null,
      section:
          json['section'] != null ? Section.fromJson(json['section']) : null,
                studentMark: json['student_mark'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_form': questionForm,
      'answer': answer,
      'mark': mark,
      'note': note,
      'ques_type': quesType,
      'class_id': classId,
      'section_id': sectionId,
      'lecture_id': lectureId,
      'lesson_id': lessonId,
      'teacher_id': teacherId,
      'coordinator_id': coordinatorId,
      'coor_id': coorId,
      'term_id': termId,
      'active': active,
      'accept': accept,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'option': option?.toJson(),
      'section': section?.toJson(),
    };
  }
}

//////////////////////
class Option {
  final int? id;
  final int? questionId;
  final List<String>? myOptions;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Option({
    this.id,
    this.questionId,
    this.myOptions,
    this.createdAt,
    this.updatedAt,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      questionId: json['question_id'],
      myOptions: json['myOptions'] != null
          ? List<String>.from(jsonDecode(json['myOptions']))
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_id': questionId,
      'myOptions': myOptions,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

/////////////////
///
class Section {
  final int? id;
  final int? classId;
  final int? roomId;
  final int? lessonId;
  final int? lectureId;
  final String? title;
  final int? type;
  final String? content;
  final int? teacherId;
  final int? coordinatorId;
  final int? termId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Section({
    this.id,
    this.classId,
    this.roomId,
    this.lessonId,
    this.lectureId,
    this.title,
    this.type,
    this.content,
    this.teacherId,
    this.coordinatorId,
    this.termId,
    this.createdAt,
    this.updatedAt,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      classId: json['class_id'],
      roomId: json['room_id'],
      lessonId: json['lesson_id'],
      lectureId: json['lecture_id'],
      title: json['title'],
      type: json['type'],
      content: json['content'],
      teacherId: json['teacher_id'],
      coordinatorId: json['coordinator_id'],
      termId: json['term_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class_id': classId,
      'room_id': roomId,
      'lesson_id': lessonId,
      'lecture_id': lectureId,
      'title': title,
      'type': type,
      'content': content,
      'teacher_id': teacherId,
      'coordinator_id': coordinatorId,
      'term_id': termId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
