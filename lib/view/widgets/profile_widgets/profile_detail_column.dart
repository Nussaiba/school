
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class ProfileDtailColumn extends StatelessWidget {
  const ProfileDtailColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('رقم التسجيل ',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColor.kTextLightColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    )),
            SizedBox(
              height: AppPadding.kDefaultPadding / 2,
            ),
            Text('2022-2021',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColor.kTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    )),
            SizedBox(
              height: AppPadding.kDefaultPadding/2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Divider(
                thickness: 1.0,
              ),
            )
          ],
        ),
        Icon(
          Icons.lock_outline,
          size: 20,
        )
      ],
    );
  }
}
