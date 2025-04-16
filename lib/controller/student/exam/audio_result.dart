import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioResultController extends GetxController {
  // final List<AudioPlayer> audioPlayers = [];
  // final List<Duration> durations = [];
  // final List<Duration> positions = [];
  // final List<bool> isPlayingList = [];
  var audioPlayers = {}.obs;
  var durations = {}.obs;
  var positions = {}.obs;
  var isPlayingList = {}.obs;

  void addAudioTrack(String audioUrl) {
    // final audioPlayer = AudioPlayer();
    // audioPlayers.add(audioPlayer);
    // durations.add(Duration.zero);
    // positions.add(Duration.zero);
    // isPlayingList.add(false);
    audioPlayers[audioUrl] =  AudioPlayer();
    durations[audioUrl] = Duration.zero;
    positions[audioUrl] = Duration.zero;
    isPlayingList[audioUrl] = false;
     audioPlayers[audioUrl] .setUrl(audioUrl).then((_) {
       audioPlayers[audioUrl] .durationStream.listen((d) {
        durations[audioUrl] = d!;
        update();
      });
       audioPlayers[audioUrl] .positionStream.listen((p) {
        positions[audioUrl] = p;
        update();
      });

       audioPlayers[audioUrl] .playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          // durations[audioUrl] = Duration.zero;
          // positions[audioUrl] = Duration.zero;
          isPlayingList[audioUrl] = false;
          update();
        }
      });
    });
  }

  void playAudio(String audioUrl) {
    // if (index >= 0 && index < audioPlayers.length) {
       audioPlayers[audioUrl].play();
      isPlayingList[audioUrl] = true;
      update();
    // }
  }

  void pauseAudio(String audioUrl) {
    // if (index >= 0 && index < audioPlayers.length) {
      audioPlayers[audioUrl].pause();
      isPlayingList[audioUrl] = false;
      update();
    // }
  }

  void stopAudio(audioUrl) {
    // if (index >= 0 && index < audioPlayers.length) {
      audioPlayers[audioUrl].stop();
      isPlayingList[audioUrl] = false;
      update(); // تحديث الحالة
    // }
  }

  @override
  void onClose() {
    // for (var player in audioPlayers) {
    //   player.dispose();
    // }
    super.onClose();
  }
}
