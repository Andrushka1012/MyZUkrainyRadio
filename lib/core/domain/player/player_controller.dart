import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:myzukrainy/helpers/app_connectivity.dart';

class PlayerController {
  PlayerController(this._audioHandler, this._appConnectivity) {
    _appConnectivity.initialise();
    isPlayingStream.listen((isPlaying) {
      if (isPlaying) {
        _resetTimer();
      } else {
        _rotationTimer?.cancel();
      }
    });
  }

  final AudioHandler _audioHandler;
  final AppConnectivity _appConnectivity;

  double rotationState = 0.0;
  Timer? _rotationTimer;
  final StreamController<double> rotationStream = StreamController.broadcast();

  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;

  Stream<bool> get isPlayingStream => playbackStateStream.map((state) => state.playing).distinct();

  void play() {
    _audioHandler.play();
  }

  void pause() {
    _audioHandler.pause();
  }

  Future playPause() async {
    final isLive = await _appConnectivity.checkIsLive();

    if (isLive) {
      if (_audioHandler.playbackState.value.playing) {
        pause();
      } else {
        play();
      }
    } else {
      _audioHandler.stop();
    }
  }

  void _resetTimer() {
    _rotationTimer?.cancel();
    _rotationTimer = Timer.periodic(
      Duration(milliseconds: 10),
      (t) {
        rotationState += 0.003;
        if (rotationState >= 1) rotationState = 0;
        rotationStream.add(rotationState);
      },
    );
  }
}
