class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String firstNameEn;
  final String lastNameEn;
  final String phone;
  final String registrationDate;
  final List<Room> rooms;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.firstNameEn,
    required this.lastNameEn,
    required this.phone,
    required this.registrationDate,
    required this.rooms,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    var roomList = json['room'] as List;
    List<Room> rooms = roomList.map((i) => Room.fromJson(i)).toList();

    return Student(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      firstNameEn: json['first_name_en'],
      lastNameEn: json['last_name_en'],
      phone: json['phone'],
      registrationDate: json['registration_date'],
      rooms: rooms,
    );
  }
}

class Room {
  final int id;
  final int classId;
  final String name;
  final Classes classes;

  Room({
    required this.id,
    required this.classId,
    required this.name,
    required this.classes,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      classId: json['class_id'],
      name: json['name'],
      classes: Classes.fromJson(json['classes']),
    );
  }
}

class Classes {
  final int id;
  final int stageId;
  final String name;
  final String nameEn;
  final String annualInstallment;
  final String image;

  Classes({
    required this.id,
    required this.stageId,
    required this.name,
    required this.nameEn,
    required this.annualInstallment,
    required this.image,
  });

  factory Classes.fromJson(Map<String, dynamic> json) {
    return Classes(
      id: json['id'],
      stageId: json['stage_id'],
      name: json['name'],
      nameEn: json['name_en'],
      annualInstallment: json['annual_installment'],
      image: json['image'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String? mobile;
  final String viewPassword;
  final Student student;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.mobile,
    required this.viewPassword,
    required this.student,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      viewPassword: json['view_password'],
      student: Student.fromJson(json['student']),
    );
  }
}

class DataModel {
  final User msg;
  final String status;
  final String type;

  DataModel({
    required this.msg,
    required this.status,
    required this.type,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      msg: User.fromJson(json['msg']),
      status: json['status'],
      type: json['type'],
    );
  }
}
