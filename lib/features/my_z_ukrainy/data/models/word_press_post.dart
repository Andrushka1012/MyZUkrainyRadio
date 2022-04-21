class WordPressPostDto {
  WordPressPostDto({
    required this.title,
    required this.shortDescription,
    required this.imageSrc,
    required this.postUrl,
    required this.dateTime,
  });

  String title;
  String shortDescription;
  String? imageSrc;
  String postUrl;
  DateTime dateTime;
}
