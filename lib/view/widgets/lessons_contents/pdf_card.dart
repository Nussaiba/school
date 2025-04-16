import 'package:flutter/material.dart';
import 'package:school/api_link.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/data/model/student/lesson_details/lesson_details_model.dart';


class FileWidget extends StatelessWidget {
  const FileWidget({
    super.key,
    required this.file,
  });

  final LessonDetailsModel file;

  @override
  Widget build(BuildContext context) {
    return Card(
   
      elevation: 6,
      shadowColor: AppColor.ksecondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
          
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: 4,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                  AppImageAsset.fileIcon
                  ),
                ),
              ),
            ),
            //  Container(
            //   height: 40,
            //   width: 40,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(
            //      "${AppLink.serverimage}/${file.addition}"
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: Text(file.nameAddition!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                          color: AppColor.kpraimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          overflow: TextOverflow.ellipsis
                        )),
              ),
            ),
                    Text('تحميل الملف',
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColor.kTextLightColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    )),
          ],
        ),
      ),
    );
  }
}
