import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:myzukrainy/app/config/app_config.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  static final _uaItem = MediaItem(
    id: AppConfig.value.uaStreamUrl,
    title: 'My z Ukrainy',
    artist: '🇵🇱 ❤️ 🇺🇦',
    artUri: Uri.parse(
      'https://raw.githubusercontent.com/Andrushka1012/MyZUkrainyRadio/main/assets/images/cover_white.jpg',
    ),
  );
  static final _plItem = MediaItem(
    id: AppConfig.value.plStreamUrl,
    title: 'Nadajemy',
    artist: '',
    artUri: Uri.parse(
      'https://paczka-wiedzy.pl/wp-content/uploads/2018/08/polska.png',
    ),
  );

  AudioPlayerHandler() {
    player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  final player = AudioPlayer();

  Future init(Station station) async{
    player.stop();

    late final MediaItem item;

    switch (station) {
      case Station.myZUkrainy:
        item = _uaItem;
        await removeQueueItem(_plItem);
        break;
      case Station.nadajemy:
        item = _plItem;
        await removeQueueItem(_uaItem);
        break;
    }

    player.setUrl(item.id);

    mediaItem.add(item);
  }

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
        if (player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
      ],
      systemActions: const {
        MediaAction.playPause,
      },
      androidCompactActionIndices: const [0],
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
