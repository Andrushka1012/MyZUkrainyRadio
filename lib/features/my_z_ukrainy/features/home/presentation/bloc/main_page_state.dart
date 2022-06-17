part of 'main_page_cubit.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState.empty() = _Empty;

  const factory MainPageState.loading() = _Loading;

  const factory MainPageState.ready(
    List<WordPressPost> posts,
    List<WordPressPodcast> podcasts,
    bool notificationsEnabled,
  ) = _Ready;

  const factory MainPageState.error(dynamic error) = _Error;

  const factory MainPageState.notify(bool notificationsEnabled) = _Notify;
}