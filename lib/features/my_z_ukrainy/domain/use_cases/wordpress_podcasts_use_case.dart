import 'package:myzukrainy/core/domain/useCase.dart';
import 'package:myzukrainy/features/my_z_ukrainy/data/repos/wordpress_repository.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/models/word_press_podcast.dart';

class FetchMyZUkrainyPodcasts extends UseCase<List<WordPressPodcast>> {
  FetchMyZUkrainyPodcasts(this._wordPressRepository);

  final WordPressRepository _wordPressRepository;

  @override
  Future<List<WordPressPodcast>> execute() async {
    final response = await _wordPressRepository.getPodcasts();

    return response.map((dto) => WordPressPodcast.fromDto(dto)).toList();
  }
}
