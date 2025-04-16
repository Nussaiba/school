class Student {
  int id;
  String firstName;
  String lastName;
  String firstNameEn;
  String lastNameEn;
  String ?phone;
  int quizeStatus;
  int oralStatus;
  int activityStatus;
  int homeworkStatus;
  int examStatus;
  String status;
  String lang;
  String religion;
  int countryCurrency;
  int hidden;
  String registrationDate;
  String isNeedExam;
  int studentRegisterId;
  String createdAt;
  String updatedAt;
  int messageApiCount;
  List<Room> room;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.firstNameEn,
    required this.lastNameEn,
     this.phone,
    required this.quizeStatus,
    required this.oralStatus,
    required this.activityStatus,
    required this.homeworkStatus,
    required this.examStatus,
    required this.status,
    required this.lang,
    required this.religion,
    required this.countryCurrency,
    required this.hidden,
    required this.registrationDate,
    required this.isNeedExam,
    required this.studentRegisterId,
    required this.createdAt,
    required this.updatedAt,
    required this.messageApiCount,
    required this.room,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      firstNameEn: json['first_name_en'],
      lastNameEn: json['last_name_en'],
      phone: json['phone'],
      quizeStatus: json['quize_status'],
      oralStatus: json['oral_status'],
      activityStatus: json['activity_status'],
      homeworkStatus: json['homework_status'],
      examStatus: json['exam_status'],
      status: json['status'],
      lang: json['lang'],
      religion: json['religion'],
      countryCurrency: json['country_currency'],
      hidden: json['hidden'],
      registrationDate: json['registration_date'],
      isNeedExam: json['is_need_exam'],
      studentRegisterId: json['student_register_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      messageApiCount: json['message_api_count'],
      room: (json['room'] as List).map((i) => Room.fromJson(i)).toList(),
    );
  }
}

class Room {
  int id;
  String name;
  int classId;
  int yearId;
  String createdAt;
  String updatedAt;
  Pivot pivot;
  Classes classes;

  Room({
    required this.id,
    required this.name,
    required this.classId,
    required this.yearId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.classes,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      classId: json['class_id'],
      yearId: json['year_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: Pivot.fromJson(json['pivot']),
      classes: Classes.fromJson(json['classes']),
    );
  }
}

class Pivot {
  int studentId;
  int roomId;

  Pivot({
    required this.studentId,
    required this.roomId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      studentId: json['student_id'],
      roomId: json['room_id'],
    );
  }
}
class Classes {
  int id;
  int stageId;
  int reportCard;
  int nextClass;
  String name;
  String nameEn;
  String annualInstallment;
  String image;
  int number;
  String createdAt;
  String updatedAt;

  Classes({
    required this.id,
    required this.stageId,
    required this.reportCard,
    required this.nextClass,
    required this.name,
    required this.nameEn,
    required this.annualInstallment,
    required this.image,
    required this.number,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Classes.fromJson(Map<String, dynamic> json) {
    return Classes(
      id: json['id'],
      stageId: json['stage_id'],
      reportCard: json['report_card'],
      nextClass: json['next_class'],
      name: json['name'],
      nameEn: json['name_en'],
      annualInstallment: json['annual_installment'],
      image: json['image'],
      number: json['number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
