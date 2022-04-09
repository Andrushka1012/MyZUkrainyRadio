import 'package:myzukrainy/core/data/dto_models/word_press_post.dart';
import 'package:myzukrainy/core/data/sources/wordpress_rest_service.dart';

class WordPressRepository {
  WordPressRepository(this._apiService);

  final WordPressApiService _apiService;

  Future<List<WordPressPostDto>> getNews() => _apiService.getNews();
}
