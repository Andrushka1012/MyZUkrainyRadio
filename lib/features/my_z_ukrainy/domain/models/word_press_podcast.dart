import 'package:myzukrainy/features/my_z_ukrainy/data/models/word_press_podcast.dart';

class WordPressPodcast {
  WordPressPodcast({
    required this.title,
    required this.podcastSrc,
    required this.imageSrc,
  });

  WordPressPodcast.fromDto(WordPressPodcastDto dto)
      : title = dto.title,
        podcastSrc = dto.podcastSrc,
        imageSrc = dto.imageSrc;

  String title;
  String podcastSrc;
  String? imageSrc;

  String? get formattedImageSrc {
    if (podcastSrc.contains('https://youtu.be/')) {
      final id = podcastSrc.split('https://youtu.be/').last;

      return 'https://img.youtube.com/vi/$id/default.jpg';
    }


    return imageSrc;
  }
}
