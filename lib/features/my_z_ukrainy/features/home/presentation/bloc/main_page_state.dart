part of 'main_page_cubit.dart';

@immutable
abstract class MainPageState {
  const MainPageState();
}

class MainPageProcessing extends MainPageState {}

class MainPageDefault extends MainPageState {
  const MainPageDefault(this.posts, this.podcasts,);

  final List<WordPressPost> posts;
  final List<WordPressPodcast> podcasts;
}

class MainPageError extends MainPageState {
  const MainPageError(this.error);

  final dynamic error;
}
