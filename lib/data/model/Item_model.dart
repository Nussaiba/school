import 'package:flutter/material.dart';

class ItemModel {
  String? name;
  IconData? icon;
  //String? icon;
  ItemModel({
    this.name,
    this.icon,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel();
}
