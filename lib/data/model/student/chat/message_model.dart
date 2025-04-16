class Message {
  int? id;
  String? message;
  int? studentId;
  int? yearId;
  int? view;
  int? teacherId;
  int? adminId;
  int? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? to;
  Message({
    this.id,
    this.message,
    this.studentId,
    this.yearId,
    this.view,
    this.teacherId,
    this.adminId,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.to
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      message: json['message'],
      studentId: json['student_id'],
      yearId: json['year_id'],
      view: json['view'],
      teacherId: json['teacher_id'],
      adminId: json['admin_id'],
      type: json['type'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
          to: json['to']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'student_id': studentId,
      'year_id': yearId,
      'view': view,
      'teacher_id': teacherId,
      'admin_id': adminId,
      'type': type,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
