class Day {
  final int day;
  final List<Lesson>? lessons; // جعل قائمة الدروس قابلة للاحتواء

  Day({required this.day, this.lessons});

  factory Day.fromJson(Map<String, dynamic> json) {
    int day = int.parse(json.keys.first);
    List<Lesson>? lessons; // جعل الدروس قابلة للاحتواء

    // التحقق مما إذا كانت هناك دروس لهذا اليوم
    if (json[day.toString()] != null && json[day.toString()] is List) {
      // إضافة الدروس إلى القائمة إذا كانت موجودة
      lessons = [];
      for (var lessonJson in json[day.toString()]) {
        lessons.add(Lesson.fromJson(lessonJson));
      }
    }

    return Day(day: day, lessons: lessons);
  }
}

class Lesson {
  final int id;
  final int lessonId;
  final int roomId;
  final int teacherId;
  final int lectureTimeId;
  final int dayId;
  final int termId;
  final int yearId;
  final String? meetingLink; // جعل meetingLink قابلاً للاحتواء
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool inter;
  final LessonDetails? lesson; // جعل lesson قابلاً للاحتواء
  final Teacher? teacher; // جعل teacher قابلاً للاحتواء

  Lesson({
    required this.id,
    required this.lessonId,
    required this.roomId,
    required this.teacherId,
    required this.lectureTimeId,
    required this.dayId,
    required this.termId,
    required this.yearId,
    this.meetingLink, // جعل meetingLink غير مطلوب
    required this.createdAt,
    required this.updatedAt,
    required this.inter,
    this.lesson, // جعل lesson غير مطلوب
    this.teacher, // جعل teacher غير مطلوب
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      lessonId: json['lesson_id'],
      roomId: json['room_id'],
      teacherId: json['teacher_id'],
      lectureTimeId: json['lecture_time_id'],
      dayId: json['day_id'],
      termId: json['term_id'],
      yearId: json['year_id'],
      meetingLink: json['meeting_link'], // يمكن أن تكون null
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      inter: json['inter'],
      lesson: json['lesson'] != null
          ? LessonDetails.fromJson(json['lesson'])
          : null, // يمكن أن تكون null
      teacher: json['teacher'] != null
          ? Teacher.fromJson(json['teacher'])
          : null, // يمكن أن تكون null
    );
  }
}

class LessonDetails {
  final int id;
  final String? name; // جعل name قابلاً للاحتواء

  LessonDetails({required this.id, this.name}); // جعل name غير مطلوب

  factory LessonDetails.fromJson(Map<String, dynamic> json) {
    return LessonDetails(
      id: json['id'],
      name: json['name'], // يمكن أن تكون null
    );
  }
}

class Teacher {
  final int id;
  final String? firstName; // جعل firstName قابلاً للاحتواء
  final String? lastName; // جعل lastName قابلاً للاحتواء

  Teacher(
      {required this.id,
      this.firstName,
      this.lastName}); // جعل firstName و lastName غير مطلوب

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      firstName: json['first_name'], // يمكن أن تكون null
      lastName: json['last_name'], // يمكن أن تكون null
    );
  }
}

class LectureTime {
  final int? id;
  final String? name;
  final int? type;
  final String? startTime;
  final String? endTime;
  final int? classId;
  final int? roomId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LectureTime({
    this.id,
    this.name,
    this.type,
    this.startTime,
    this.endTime,
    this.classId,
    this.roomId,
    this.createdAt,
    this.updatedAt,
  });

  factory LectureTime.fromJson(Map<String, dynamic> json) {
    return LectureTime(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      classId: json['class_id'],
      roomId: json['room_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}

class Weekday {
  final int id;
  final String name;
  final String nameEn;
  final String notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Weekday({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.notes,
    this.createdAt,
    this.updatedAt,
  });

  // دالة لتحويل كائن من نوع Map إلى كائن من نوع Weekday
  factory Weekday.fromJson(Map<String, dynamic> map) {
    return Weekday(
      id: map['id'],
      name: map['name'],
      nameEn: map['name_en'],
      notes: map['notes'],
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
    );
  }

  // دالة لتحويل كائن من نوع Weekday إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'name_en': nameEn,
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
