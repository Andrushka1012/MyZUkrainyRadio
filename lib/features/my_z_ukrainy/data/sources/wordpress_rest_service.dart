import 'package:dio/dio.dart';
import 'package:myzukrainy/features/my_z_ukrainy/data/models/word_press_post.dart';

class WordPressApiService {
  WordPressApiService(this._dio);

  final Dio _dio;
  final String _baseUrl = '/wp-json/wp/v2';

  Future<List<WordPressPostDto>> getNews() => _dio.get('$_baseUrl/posts', queryParameters: {
        'page': 1,
        'per_page': 10,
        'categories_exclude': [11],
      }).then(
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
