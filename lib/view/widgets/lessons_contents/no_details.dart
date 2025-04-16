
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';

class buildTabContent extends StatelessWidget {
  const buildTabContent({super.key, required this.icon, required this.message});
  final IconData icon;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 70, color: AppColor.kpraimaryColor),
          SizedBox(height: 15),
          Text(message, style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}
