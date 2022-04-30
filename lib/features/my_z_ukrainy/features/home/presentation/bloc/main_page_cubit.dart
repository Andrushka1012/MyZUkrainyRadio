import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/models/word_press_podcast.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/models/word_press_post.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/use_cases/wordpress_news_use_case.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/use_cases/wordpress_podcasts_use_case.dart';

part 'main_page_cubit.freezed.dart';
part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit(
    this._fetchNews,
    this._fetchPodcasts,
  ) : super(MainPageState.loading());

  final FetchMyZUkrainyNews _fetchNews;
  final FetchMyZUkrainyPodcasts _fetchPodcasts;

  Future init() async {
    emit(MainPageState.loading());

    late final List<WordPressPost> posts;
    late final List<WordPressPodcast> podcasts;
    dynamic error;

    final postsResponse = await _fetchNews.executeSafety();
    final podcastsResponse = await _fetchPodcasts.executeSafety();

    postsResponse.fold(
      onSuccess: (news) {
        posts = news;
      },
      onError: (fetchError) {
        error = fetchError;
        posts = const [];
      },
    );

    podcastsResponse.fold(
      onSuccess: (news) {
        podcasts = news;
      },
      onError: (fetchError) {
        error = fetchError;
        podcasts = const [];
      },
    );

    if (error != null) {
      emit(MainPageState.error(error));
    }

    if (posts.isNotEmpty || podcasts.isNotEmpty) {
      emit(MainPageState.ready(
        posts,
        podcasts,
      ));
    } else {
      emit(MainPageState.empty());
    }
  }
}
