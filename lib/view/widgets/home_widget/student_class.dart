import 'package:flutter/material.dart';

class StudentClass extends StatelessWidget {
  const StudentClass({
    super.key, required this.text1, required this.text2,
  });
final String text1;
    final String text2;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text1 | $text2 ',
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14.0,
          ),
    );
  }
}
