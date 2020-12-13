import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class HandleAudio with ChangeNotifier {
  AudioPlayer audioPlayer;
  AudioCache audioCache = AudioCache();

  void playMusic() async {
    audioPlayer = await audioCache.loop("jingle.mp3");
  }

  void stopMusic() async {
    audioPlayer.stop();
  }

  void handleAudio(bool value) {
    switch (value) {
      case true:
        return playMusic();
        break;
      case false:
        return stopMusic();
      default:
        return stopMusic();
    }
  }

  void disable() {
    audioPlayer.dispose();
  }
}
