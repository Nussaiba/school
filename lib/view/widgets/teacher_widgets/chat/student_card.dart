import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/data/model/teacher/chat/student_model.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.student,
  });

  final Student student;

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
            '${student.firstName} ${student.lastName}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColor.kTextBlackColor,
                fontSize: 18.0,
                height: 2,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${student.room[0].classes.name} / ${student.room[0].name}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColor.kTextBlackColor,
                      fontSize: 16.0,
                      overflow: TextOverflow.ellipsis,

                    ),
              ),
              SizedBox(height: 4),
            ],
          ),
         
        ),
      ],
    );
  }
}
