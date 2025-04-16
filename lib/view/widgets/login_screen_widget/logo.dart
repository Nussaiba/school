import 'package:flutter/material.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';

class LoginSectionOne extends StatelessWidget {
  const LoginSectionOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.0,
      //  color: AppColor.kOtherColor,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImageAsset.logo,
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: AppPadding.kDefaultPadding / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'أهلاً بك',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      fontFamily: 'Tajawal',
                    ),
              ),
              Text(' '),
              // Text(
              //   'عزيزي الطالب ',
              //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              //         fontWeight: FontWeight.w800,
              //         fontSize: 30,
              //         fontFamily: 'Tajawal',
              //       ),
              // ),
            ],
          ),
          SizedBox(height: AppPadding.kDefaultPadding / 2),
          Text('سجل دخول للاستمرار',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontFamily: 'Tajawal',

              )),
        ],
      ),
    );
  }
}
