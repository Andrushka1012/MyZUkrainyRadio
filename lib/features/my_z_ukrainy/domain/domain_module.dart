import 'package:koin/koin.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/use_cases/wordpress_news_use_case.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/use_cases/wordpress_podcasts_use_case.dart';

final myZUkrainyDomainModule = Module()
  ..single((scope) => FetchMyZUkrainyNews(scope.get()))
  ..single((scope) => FetchMyZUkrainyPodcasts(scope.get()));
