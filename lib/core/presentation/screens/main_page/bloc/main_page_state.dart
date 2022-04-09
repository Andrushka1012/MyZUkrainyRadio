part of 'main_page_cubit.dart';

@immutable
abstract class MainPageState {
  const MainPageState();
}

class MainPageProcessing extends MainPageState {}

class MainPageDefault extends MainPageState {
  const MainPageDefault(this.posts);

  final List<WordPressPost> posts;
}

class MainPageError extends MainPageState {
  const MainPageError(this.error);

  final dynamic error;
}
