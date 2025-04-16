import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  AudioController();
  final AudioPlayer audioPlayer = AudioPlayer();
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var isPlaying = false.obs;

  listen(String audioUrl) {
    audioPlayer
        .setUrl(audioUrl)
        .then((_) {
      audioPlayer.durationStream.listen((d) {
        duration.value = d!;
      });
      audioPlayer.positionStream.listen((p) {
        position.value = p;
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
   
  }

  void playAudio( String audioUrl) {
       listen(audioUrl);

    audioPlayer.play();
    isPlaying.value = true;
        // update();

  }

  void pauseAudio() {
    audioPlayer.pause();
    isPlaying.value = false;
        // update();

  }

  void stopAudio() {
    audioPlayer.stop();
    isPlaying.value = false;
        // update();

  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
