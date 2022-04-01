import 'package:myzukrainy/generated/locale_keys.g.dart';
import 'package:radio_player/radio_player.dart';
import 'package:easy_localization/easy_localization.dart';

class PlayerController {

  final RadioPlayer radioPlayer = RadioPlayer();

  PlayerController() {
    radioPlayer.setChannel(title: LocaleKeys.myZUkrainy.tr(), url: 'http://stream3.polskieradio.pl:8900/listen.pls');
  }

  void play() {
    radioPlayer.play();
  }

  void pause() {
    radioPlayer.pause();
  }

  void stop() {
    radioPlayer.stop();
  }

}