import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/data/model/student/chat/teacher_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.teacher,
  });

  final UserModel teacher;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(2),
          leading: CircleAvatar(
            radius: 48,
            backgroundColor: AppColor.ksecondColor.withOpacity(0.3),
            child: Icon(
              Icons.person,
              size: 35,
            ),
          ),
          title: Text(
            '${teacher.firstName}  ${teacher.lastName}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColor.kTextBlackColor,
                fontSize: 18.0,
                height: 2,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(height: 4),
            ],
          ),
        
        ),
      ],
    );
  }
}
