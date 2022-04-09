import 'package:koin/koin.dart';
import 'package:myzukrainy/core/data/repos/wordpress_repository.dart';
import 'package:myzukrainy/core/data/sources/wordpress_rest_service.dart';

final dataModule = Module()
  ..single((scope) => WordPressApiService(scope.get()))
  ..single((scope) => WordPressRepository(scope.get()));
