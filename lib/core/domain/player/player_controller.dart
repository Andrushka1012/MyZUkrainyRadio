import 'package:audio_service/audio_service.dart';

class PlayerController {
  PlayerController(this._audioHandler);

  final AudioHandler _audioHandler;

  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;

  void play() {
    _audioHandler.play();
  }
  void pause() {
    _audioHandler.pause();
  }
}
