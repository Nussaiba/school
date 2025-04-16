import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/exam/audio_controller.dart';
import 'package:school/core/constants/app_color.dart';

class AudioPage extends StatelessWidget {
  // final String url;
  // AudioPage({super.key, required this.url});
  // final AudioController audioController = Get.put(AudioController(

  // ));
  final String url;
  late final AudioController audioController;

  AudioPage({required this.url}) {
    audioController = Get.put(AudioController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(audioController.isPlaying.value
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: () {
                      if (audioController.isPlaying.value) {
                        audioController.pauseAudio();
                      } else {
                        audioController.playAudio(url);
                      }
                    },
                    color: AppColor.kpraimaryColor,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Slider(
                    thumbColor: AppColor.kpraimaryColor,
                    activeColor: AppColor.ksecondColor,
                    value: audioController.position.value.inSeconds.toDouble(),
                    min: 0,
                    max: audioController.duration.value.inSeconds.toDouble(),
                    onChanged: (value) {
                      audioController.audioPlayer
                          .seek(Duration(seconds: value.toInt()));
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 18),
                // المدة الحالية
                Text(formatDuration(audioController.position.value),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColor.kTextBlackColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.0,
                        )),
                Spacer(),
                // المدة الكاملة
                Text(formatDuration(audioController.duration.value),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColor.kTextBlackColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.0,
                        )),
                SizedBox(width: 18),
              ],
            ),

         
          ],
        ),
      );
    });
  }

  // دالة لتنسيق المدة
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
