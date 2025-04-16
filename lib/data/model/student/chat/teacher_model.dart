class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dateOfBirth;
  int? age;
  String? address;
  String? phone;
  String? image;
  String? descriptionAr;
  String? descriptionEn;
  String? type;
  String? salary;
  String? gender;
  String? religion;
  String? dateArchive;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? messageCount;
  int? userType;
  Pivot? pivot;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.age,
    this.address,
    this.phone,
    this.image,
    this.descriptionAr,
    this.descriptionEn,
    this.type,
    this.salary,
    this.gender,
    this.religion,
    this.dateArchive,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.messageCount,
    this.userType,
    this.pivot,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      dateOfBirth: json['date_birth'],
      age: json['age'],
      address: json['address'],
      phone: json['phone'],
      image: json['image'],
      descriptionAr: json['Description_ar'],
      descriptionEn: json['Description_en'],
      type: json['type'],
      salary: json['salary'],
      gender: json['gender'],
      religion: json['religion'],
      dateArchive: json['date_archive'],
      active: json['active'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      messageCount: json['message_count'],
      userType: json['user_type'],
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'date_birth': dateOfBirth,
      'age': age,
      'address': address,
      'phone': phone,
      'image': image,
      'Description_ar': descriptionAr,
      'Description_en': descriptionEn,
      'type': type,
      'salary': salary,
      'gender': gender,
      'religion': religion,
      'date_archive': dateArchive,
      'active': active,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'message_count': messageCount,
      'user_type': userType,
      'pivot': pivot?.toJson(),
    };
  }
}

class Pivot {
  int? roomId;
  int? teacherId;

  Pivot({
    this.roomId,
    this.teacherId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      roomId: json['room_id'],
      teacherId: json['teacher_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'room_id': roomId,
      'teacher_id': teacherId,
    };
  }
}
