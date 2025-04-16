import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class SubjectName extends StatelessWidget {
  const SubjectName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.ksecondColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              AppPadding.kDefaultPadding,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Center(
              child: Text(name,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.kpraimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      )),
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}
