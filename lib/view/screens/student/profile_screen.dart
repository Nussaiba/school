import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/core/constants/app_padding.dart';
import 'package:school/view/widgets/general/sized_box.dart';
import 'package:school/view/widgets/profile_widgets/profile_detail_column.dart';
import 'package:school/view/widgets/profile_widgets/profile_detail_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: AppPadding.kDefaultPadding / 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.report_gmailerrorred_outlined),
                  SizedBox(
                    width: AppPadding.kDefaultPadding / 2,
                  ),
                  Text('إبلاغ', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: AppColor.kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: AppColor.kpraimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight:
                        Radius.circular(AppPadding.kDefaultPadding * 2),
                    bottomLeft: Radius.circular(AppPadding.kDefaultPadding * 2),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 50,
                    minRadius: 50,
                    backgroundColor: AppColor.ksecondColor,
                    backgroundImage: AssetImage(
                      AppImageAsset.student,
                    ),
                  ),
                  SizedBox(
                    width: AppPadding.kDefaultPadding * 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('نور محمد',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text('الثالث | الرابعة',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.0,
                                  )),
                    ],
                  )
                ],
              ),
            ),
            CustomSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(),
                ProfileDetailRow(),
              ],
            ),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(),
                ProfileDetailRow(),
              ],
            ),
            
            ProfileDtailColumn(),
            ProfileDtailColumn(),
            ProfileDtailColumn(),
            ProfileDtailColumn()
          ],
        ),
      ),
    );
  }
}
