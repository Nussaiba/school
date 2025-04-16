import 'package:flutter/material.dart';

class ItemDropDown extends StatelessWidget {
  const ItemDropDown({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        name,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
