// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:school/core/constants/app_color.dart';

// class VideoCard extends StatelessWidget {
//   const VideoCard({super.key, required this.title, required this.image});
//   final String title;
//   final String image;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: AppColor.white,
//       elevation: 2,
//       shadowColor: AppColor.black,
//       margin: EdgeInsets.all(4),
//       child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         Container(
//           margin: EdgeInsets.all(Get.width * 0.02),
//           height: Get.height * .09,
//           width: Get.width * 0.34,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             shape: BoxShape.rectangle,
//             image: DecorationImage(
//               image: AssetImage(
//                 image,
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: Get.width * 0.03,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               // height: 30,
//               width: Get.width / 2,
//               child: Text(
//                 title,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//                 style: Get.textTheme.bodyMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // crossAxisAlignment: CrossAxisAlignment.center,

//               children: [
//                 _buildPlayButton(),
//                 SizedBox(
//                   width: 36,
//                 ),
//                 Text(
//                   'Download',
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     fontWeight: FontWeight.w300,
//                     color: AppColor.kTextBlackColor,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//       ]),
//     );
//   }
// }

// _buildPlayButton() {
//   return TextButton.icon(
//     icon: const Icon(
//       Icons.play_circle,
//       color: Colors.indigoAccent,
//       size: 24,
//     ),
//     onPressed: () {},
//     label: const Text('Play',
//     ),
//   );

// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_image.dart';
import 'package:school/data/model/student/lesson_details/lesson_details_model.dart';
import 'package:school/view/screens/student/lesson_contents/lesson_video.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
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
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.all(Get.width * 0.02),
              height: Get.height * .15,
              width: Get.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(AppImageAsset.videoIcon, ),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Center(
                child: Text(file.nameVideo!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColor.kpraimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        overflow: TextOverflow.ellipsis)),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            // SizedBox(
            //   height:2,
            // ),

            Text('تحميل الفيديو',
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
