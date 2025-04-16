import 'dart:convert';

class ClassModel {
  final int? id;
  final int? stageId;
  final int? reportCard;
  final int? nextClass;
  final String? name;
  final String? nameEn;
  final String? annualInstallment;
  final String? image;
  final bool? isScientific;
  final int? number;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ClassModel({
    this.id,
    this.stageId,
    this.reportCard,
    this.nextClass,
    this.name,
    this.nameEn,
    this.annualInstallment,
    this.image,
    this.isScientific,
    this.number,
    this.createdAt,
    this.updatedAt,
  });

  // دالة لتحويل JSON إلى ClassModel
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      stageId: json['stage_id'],
      reportCard: json['report_card'],
      nextClass: json['next_class'],
      name: json['name'],
      nameEn: json['name_en'],
      annualInstallment: json['annual_installment'],
      image: json['image'],
      isScientific: json['is_scientific'],
      number: json['number'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  // دالة لتحويل ClassModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stage_id': stageId,
      'report_card': reportCard,
      'next_class': nextClass,
      'name': name,
      'name_en': nameEn,
      'annual_installment': annualInstallment,
      'image': image,
      'is_scientific': isScientific,
      'number': number,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
