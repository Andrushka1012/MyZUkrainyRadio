import 'package:myzukrainy/features/my_z_ukrainy/data/models/word_press_post.dart';
import 'package:myzukrainy/features/my_z_ukrainy/data/sources/wordpress_rest_service.dart';

class WordPressRepository {
  WordPressRepository(this._apiService);

  final WordPressApiService _apiService;

  Future<List<WordPressPostDto>> getNews() => _apiService.getNews();
}
