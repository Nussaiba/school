import 'dart:convert';

class RoomModel {
  final int? id;
  final String? name;
  final int? classId;
  final int? yearId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  RoomModel({
    this.id,
    this.name,
    this.classId,
    this.yearId,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  // دالة لتحويل JSON إلى RoomModel
  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'],
      name: json['name'],
      classId: json['class_id'],
      yearId: json['year_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
    );
  }

  // دالة لتحويل RoomModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'class_id': classId,
      'year_id': yearId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'pivot': pivot?.toJson(),
    };
  }
}

class Pivot {
  final int? teacherId;
  final int? roomId;

  Pivot({
    this.teacherId,
    this.roomId,
  });

  // دالة لتحويل JSON إلى Pivot
  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      teacherId: json['teacher_id'],
      roomId: json['room_id'],
    );
  }

  // دالة لتحويل Pivot إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'teacher_id': teacherId,
      'room_id': roomId,
    };
  }
}
