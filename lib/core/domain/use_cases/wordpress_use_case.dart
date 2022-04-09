import 'package:myzukrainy/core/data/helpers/fetch_helpers.dart';
import 'package:myzukrainy/core/data/repos/wordpress_repository.dart';
import 'package:myzukrainy/core/domain/domain_models/word_press_post.dart';

class WordPressUseCase {
  WordPressUseCase(this._wordPressRepository);

  final WordPressRepository _wordPressRepository;

  Future<SafeResponse<List<WordPressPost>>> getNews() => fetchSafety(() async {
        final response = await _wordPressRepository.getNews();

        return response.map((dto) => WordPressPost.fromDto(dto)).toList();
      });
}
