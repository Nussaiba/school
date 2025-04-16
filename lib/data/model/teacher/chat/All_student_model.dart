class StudentModel {
  final int id;
  final String firstName;
  final String lastName;
  final Pivot pivot;

  StudentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.pivot,
  });

  // دالة لتحويل JSON إلى كائن Student
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }

  // دالة لتحويل كائن Student إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'pivot': pivot.toJson(),
    };
  }
}

class Pivot {
  final int roomId;
  final int studentId;

  Pivot({
    required this.roomId,
    required this.studentId,
  });

  // دالة لتحويل JSON إلى كائن Pivot
  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      roomId: json['room_id'],
      studentId: json['student_id'],
    );
  }

  // دالة لتحويل كائن Pivot إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'room_id': roomId,
      'student_id': studentId,
    };
  }
}