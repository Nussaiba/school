class Lesson {
  final int? id;
  final String? name;
  final int? lessonId;
  final int? roomId;
  final int? classId;
  final int? teacherId;
  final int? yearId;
  final String? startTime;
  final String? endTime;
  final String? startDate;
  final String? endDate;
  final int? active;
  final int? key;
  final int? termId;
  final String? lectureTime;
  final String? isGlobal;
  final String? createdAt;
  final String? updatedAt;

  Lesson({
    this.id,
    this.name,
    this.lessonId,
    this.roomId,
    this.classId,
    this.teacherId,
    this.yearId,
    this.startTime,
    this.endTime,
    this.startDate,
    this.endDate,
    this.active,
    this.key,
    this.termId,
    this.lectureTime,
    this.isGlobal,
    this.createdAt,
    this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      name: json['name'],
      lessonId: json['lesson_id'],
      roomId: json['room_id'],
      classId: json['class_id'],
      teacherId: json['teacher_id'],
      yearId: json['year_id'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      active: json['active'],
      key: json['key'],
      termId: json['term_id'],
      lectureTime: json['lecture_time'],
      isGlobal: json['is_global'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lesson_id': lessonId,
      'room_id': roomId,
      'class_id': classId,
      'teacher_id': teacherId,
      'year_id': yearId,
      'start_time': startTime,
      'end_time': endTime,
      'start_date': startDate,
      'end_date': endDate,
      'active': active,
      'key': key,
      'term_id': termId,
      'lecture_time': lectureTime,
      'is_global': isGlobal,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
