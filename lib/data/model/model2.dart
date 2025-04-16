import 'dart:convert';

class SubjectsModel {
  final int? id;
  final int? baseSubjectId;
  final int? markBaseSubjectId;
  final int? certificateOrder;
  final int? isAddable;
  final int? isProject;
  final int? firstTotal;
  final int? isNeutral;
  final String? isBehavior;
  final String? name;
  final String? nameEn;
  final int? classId;
  final int? maxMark;
  final int? minMark;
  final int? isEnglish;
  final String? books;
  final int? notAffectAndCollect;
  final int? assistanceMark;
  final int? lessonCount;
  final String? isApproveLesson;
  final String? createdAt;
  final String? updatedAt;

  SubjectsModel({
    this.id,
    this.baseSubjectId,
    this.markBaseSubjectId,
    this.certificateOrder,
    this.isAddable,
    this.isProject,
    this.firstTotal,
    this.isNeutral,
    this.isBehavior,
    this.name,
    this.nameEn,
    this.classId,
    this.maxMark,
    this.minMark,
    this.isEnglish,
    this.books,
    this.notAffectAndCollect,
    this.assistanceMark,
    this.lessonCount,
    this.isApproveLesson,
    this.createdAt,
    this.updatedAt,
  });

  factory SubjectsModel.fromJson(Map<String, dynamic> json) {
    return SubjectsModel(
      id: json['id'],
      baseSubjectId: json['base_subject_id'],
      markBaseSubjectId: json['mark_base_subject_id'],
      certificateOrder: json['certificate_order'],
      isAddable: json['is_addable'],
      isProject: json['is_project'],
      firstTotal: json['first_total'],
      isNeutral: json['is_neutral'],
      isBehavior: json['is_behavior'],
      name: json['name'],
      nameEn: json['name_en'],
      classId: json['class_id'],
      maxMark: json['max_mark'],
      minMark: json['min_mark'],
      isEnglish: json['is_english'],
      books: json['books'],
      notAffectAndCollect: json['not_affect_and_collect'],
      assistanceMark: json['assistance_mark'],
      lessonCount: json['lesson_count'],
      isApproveLesson: json['is_approve_lesson'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Room {
  final int id;
  final String name;
  final int classId;
  final int yearId;
  final String createdAt;
  final String updatedAt;
  final List<SubjectsModel> lessons;

  Room({
    required this.id,
    required this.name,
    required this.classId,
    required this.yearId,
    required this.createdAt,
    required this.updatedAt,
    required this.lessons,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    var lessonList = json['lessons2'] as List;
    List<SubjectsModel> lessons =
        lessonList.map((i) => SubjectsModel.fromJson(i)).toList();

    return Room(
      id: json['id'],
      name: json['name'],
      classId: json['class_id'],
      yearId: json['year_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      lessons: lessons,
    );
  }
}

class DataModel {
  final Room msg;
  final String status;
  final String type;

  DataModel({
    required this.msg,
    required this.status,
    required this.type,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      msg: Room.fromJson(json['msg']),
      status: json['status'],
      type: json['type'],
    );
  }
}
