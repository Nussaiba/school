class Schedule {
  List<DaySchedule>? schedule;

  Schedule({this.schedule});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    var list = json['schedule'] as List?;
    List<DaySchedule>? scheduleList = list?.map((i) => DaySchedule.fromJson(i)).toList();
    return Schedule(schedule: scheduleList);
  }
}

class DaySchedule {
  int? day;
  List<LessonDetail>? lessons;

  DaySchedule({this.day, this.lessons});

  factory DaySchedule.fromJson(Map<String, dynamic> json) {
    int day = int.parse(json.keys.first);
    var list = json[day.toString()] as List?;
    List<LessonDetail>? lessonList = list?.map((i) => LessonDetail.fromJson(i)).toList();
    return DaySchedule(day: day, lessons: lessonList);
  }
}

class LessonDetail {
  int? id;
  int? lessonId;
  int? roomId;
  int? teacherId;
  int? lectureTimeId;
  int? dayId;
  int? termId;
  int? yearId;
  String? meetingLink;
  String? createdAt;
  String? updatedAt;
  bool? inter;
  Lesson? lesson;
  LectureTime? lectureTime;
  Room? room;

  LessonDetail({
    this.id,
    this.lessonId,
    this.roomId,
    this.teacherId,
    this.lectureTimeId,
    this.dayId,
    this.termId,
    this.yearId,
    this.meetingLink,
    this.createdAt,
    this.updatedAt,
    this.inter,
    this.lesson,
    this.lectureTime,
    this.room,
  });

  factory LessonDetail.fromJson(Map<String, dynamic> json) {
    return LessonDetail(
      id: json['id'],
      lessonId: json['lesson_id'],
      roomId: json['room_id'],
      teacherId: json['teacher_id'],
      lectureTimeId: json['lecture_time_id'],
      dayId: json['day_id'],
      termId: json['term_id'],
      yearId: json['year_id'],
      meetingLink: json['meeting_link'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      inter: json['inter'],
      lesson: json['lesson'] != null ? Lesson.fromJson(json['lesson']) : null,
      lectureTime: json['lecture_time'] != null ? LectureTime.fromJson(json['lecture_time']) : null,
      room: json['room'] != null ? Room.fromJson(json['room']) : null,
    );
  }
}

class Lesson {
  int? id;
  String? name;

  Lesson({this.id, this.name});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      name: json['name'],
    );
  }
}

class LectureTime {
  int? id;
  String? name;
  int? type;
  String? startTime;
  String? endTime;
  int? classId;
  int? roomId;
  String? createdAt;
  String? updatedAt;

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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Room {
  int? id;
  String? name;
  int? classId;
  int? yearId;
  String? createdAt;
  String? updatedAt;
  Class? classes;

  Room({
    this.id,
    this.name,
    this.classId,
    this.yearId,
    this.createdAt,
    this.updatedAt,
    this.classes,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      classId: json['class_id'],
      yearId: json['year_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      classes: json['classes'] != null ? Class.fromJson(json['classes']) : null,
    );
  }
}

class Class {
  int? id;
  String? name;

  Class({this.id, this.name});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'],
      name: json['name'],
    );
  }
}