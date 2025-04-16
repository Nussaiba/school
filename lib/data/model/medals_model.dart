import 'dart:convert';

import 'package:school/data/model/lessons_model.dart';

class MedalsModel {
  final int id;
  final int studentId;
  final int rewardAndSanctionId;
  final int type;
  final int lessonId;
  final int roomId;
  final int classId;
  final int termId;
  final int teacherId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Lesson lesson;
  final RewardAndSanction rewardAndSanction;
  MedalsModel({
    required this.id,
    required this.studentId,
    required this.rewardAndSanctionId,
    required this.type,
    required this.lessonId,
    required this.roomId,
    required this.classId,
    required this.termId,
    required this.teacherId,
    required this.createdAt,
    required this.updatedAt,
    required this.lesson,
        required this.rewardAndSanction,

    
  });

  factory MedalsModel.fromJson(Map<String, dynamic> json) {
    return MedalsModel(
      id: json['id'],
      studentId: json['student_id'],
      rewardAndSanctionId: json['rewad_and_sanction_id'],
      type: json['type'],
      lessonId: json['lesson_id'],
      roomId: json['room_id'],
      classId: json['class_id'],
      termId: json['term_id'],
      teacherId: json['teacher_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      lesson: Lesson.fromJson(json['lesson']),
      rewardAndSanction :RewardAndSanction.fromJson(json['rewad_and_sanction']), 
    );
  }
}

class RewardAndSanction {
  int id;
  String name;
  int type;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  RewardAndSanction({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RewardAndSanction.fromJson(Map<String, dynamic> json) {
    return RewardAndSanction(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
