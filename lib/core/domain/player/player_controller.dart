import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:myzukrainy/helpers/app_connectivity.dart';

enum ControllerResult {
  processing,
  noInternet,
  offline,
  live,
}

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

    _appConnectivity.connectionStream.listen((hasConnection) {
      if (!hasConnection) {
        _stop();
      }
    });
  }

  final AudioHandler _audioHandler;
  final AppConnectivity _appConnectivity;

  double rotationState = 0.0;
  bool _processing = false;
  Timer? _rotationTimer;
  final StreamController<double> rotationStream = StreamController.broadcast();

  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;

  Stream<bool> get isPlayingStream => playbackStateStream.map((state) => state.playing).distinct();

  void _play() {
    _audioHandler.play();
  }

  void _pause() {
    _audioHandler.pause();
  }

  void _stop() {
    _audioHandler.stop();
  }

  Future<ControllerResult> playPause() async {
    if (_processing) return ControllerResult.processing;
    _processing = true;

    final isLiveState = await _appConnectivity.checkIsLive();

    if (isLiveState == ControllerResult.live) {
      if (_audioHandler.playbackState.value.playing) {
        _pause();
      } else {
        _play();
      }

      _processing = false;
    } else {
      _stop();
      _processing = false;
    }

    return isLiveState;
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
