import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:myzukrainy/config/app_config.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  static final _item = MediaItem(
      id: AppConfig.value.streamUrl,
      title: 'My z Ukrainy',
      artist: '🇵🇱 ❤️ 🇺🇦',
      artUri: Uri.file('assets/images/cover_white.jpg'));

  AudioPlayerHandler() {
    player.setUrl(_item.id);
    mediaItem.add(_item);
    player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  final player = AudioPlayer();

  @override
  Future<void> play() {
    player.play();
    return super.play();
  }

  @override
  Future<void> pause() {
    player.pause();
    return super.pause();
  }

  @override
  Future<void> stop() {
    player.stop();
    return super.stop();
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.playPause,
      },
      androidCompactActionIndices: const [1],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[player.processingState]!,
      playing: player.playing,
      updatePosition: player.position,
      bufferedPosition: player.bufferedPosition,
      speed: player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
