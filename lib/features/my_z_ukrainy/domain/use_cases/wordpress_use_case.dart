import 'package:myzukrainy/core/domain/useCase.dart';
import 'package:myzukrainy/features/my_z_ukrainy/data/repos/wordpress_repository.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/models/word_press_post.dart';

class FetchMyZUkrainyNews extends UseCase<List<WordPressPost>> {
  FetchMyZUkrainyNews(this._wordPressRepository);

  final WordPressRepository _wordPressRepository;

  @override
  Future<List<WordPressPost>> execute() async {
    final response = await _wordPressRepository.getNews();

    return response.map((dto) => WordPressPost.fromDto(dto)).toList();
  }
}
