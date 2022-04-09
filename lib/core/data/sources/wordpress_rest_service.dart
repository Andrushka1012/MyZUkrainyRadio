import 'package:dio/dio.dart';
import 'package:myzukrainy/core/data/dto_models/word_press_post.dart';

class WordPressApiService {
  WordPressApiService(this._dio);

  final Dio _dio;
  final String _baseUrl = '/wp-json/wp/v2';

  Future<List<WordPressPostDto>> getNews() => _dio.get('$_baseUrl/posts').then(
        (response) => (response.data as Iterable).map((json) {
          final acf = json['acf'];

          return WordPressPostDto(
            title: acf['title'],
            shortDescription: acf['short_description'],
            imageSrc: acf['image_src'],
            postUrl: json['link'],
            dateTime: DateTime.parse(json['date']),
          );
        }).toList(),
      );
}
