import 'package:myzukrainy/core/data/dto_models/word_press_post.dart';

class WordPressPost {
  WordPressPost({
    required this.title,
    required this.shortDescription,
    required this.imageSrc,
    required this.postUrl,
    required this.dateTime,
  });

  WordPressPost.fromDto(WordPressPostDto dto)
      : title = dto.title,
        shortDescription = dto.shortDescription,
        imageSrc = dto.imageSrc,
        postUrl = dto.postUrl,
        dateTime = dto.dateTime.toLocal();

  String title;
  String shortDescription;
  String? imageSrc;
  String postUrl;
  DateTime dateTime;
}
