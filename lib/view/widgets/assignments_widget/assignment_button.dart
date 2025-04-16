import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class AssignmentButton extends StatelessWidget {
  const AssignmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(
            left: AppPadding.kDefaultPadding/2,
            right: AppPadding.kDefaultPadding/2,
          ),
        
          width: double.infinity,
          height: 42.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
       colors: [
         AppColor.ksecondColor,
         AppColor.kpraimaryColor,
       ],
       begin: const FractionalOffset(0.0, 0.0),
       end: const FractionalOffset(0.5, 0.0),
       stops: [
         0.0,
         1.0,
       ],
       tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(AppPadding.kDefaultPadding)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text('تحميل الواجب',
       style: Theme.of(context).textTheme.bodySmall!.copyWith(
             fontWeight: FontWeight.w700,
             fontSize: 16.0,
           )),
              Spacer(),
          
            ],
          ),
        );
  }
}