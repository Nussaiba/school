import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/student/exam/audio_result.dart';
import 'package:school/core/constants/app_color.dart';

class AudioResultPage extends StatelessWidget {
  final String url;
  final int i;
  late final AudioResultController audioController;

  AudioResultPage({required this.url, required this.i}) {
    audioController = Get.put(AudioResultController());
    audioController.addAudioTrack(url);
  }

  @override
  Widget build(BuildContext context) {
    return     GetBuilder<AudioResultController>(
                      builder: (controller) {
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(audioController.isPlayingList[url]
                      ? Icons.pause
                      : Icons.play_arrow),
                  onPressed: () {
                    if (audioController.isPlayingList[url]) {
                      audioController.pauseAudio(url);
                    } else {
                      audioController.playAudio(url);
                    }
                  },
                  color: AppColor.kpraimaryColor,
                ),
                Expanded(
                  flex: 6,
                  child: Slider(
                    thumbColor: AppColor.kpraimaryColor,
                    //inactiveColor:  AppColor.kpraimaryColor,
                    activeColor: AppColor.ksecondColor,
                    value: audioController.positions[url].inSeconds.toDouble(),
                    min: 0,
                    max: audioController.durations[url].inSeconds.toDouble(),
                    onChanged: (value) {
                      audioController.audioPlayers[url]
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
                Text(formatDuration(audioController.positions[url]),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColor.kTextBlackColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.0,
                        )),
                Spacer(),
                // المدة الكاملة
                Text(formatDuration(audioController.durations[url]),
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
