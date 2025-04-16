
import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: AppPadding.kDefaultPadding / 4,
        left: AppPadding.kDefaultPadding / 4,
        top: AppPadding.kDefaultPadding / 2,
      ),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
                height: AppPadding.kDefaultPadding/2,
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
                width: MediaQuery.of(context).size.width / 3,
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
      ),
    );
  }
}
