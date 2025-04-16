
import 'package:flutter/material.dart';

class StudentName extends StatelessWidget {
  const StudentName({
    super.key, required this.text1, required this.text2,
  });
  final String text1;
    final String text2;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w200,
    
                    // color: AppColor.kTextWhiteColor,
                    // fontSize: 50.0,
                    // fontStyle: FontStyle.italic,
                    // letterSpacing: 2.0,
                  ),
        ),
        Text(' '),
        Text(
          text2,
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
    
                    // color: AppColor.kTextWhiteColor,
                    // fontSize: 50.0,
                    // fontStyle: FontStyle.italic,
                    // letterSpacing: 2.0,
                  ),
        ),
      ],
    );
  }
}