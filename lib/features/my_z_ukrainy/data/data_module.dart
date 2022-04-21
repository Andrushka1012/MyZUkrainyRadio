import 'package:koin/koin.dart';
import 'package:myzukrainy/features/my_z_ukrainy/data/repos/wordpress_repository.dart';

import 'sources/wordpress_rest_service.dart';

final nyZUkrainyDataModule = Module()
  ..single((scope) => WordPressApiService(scope.get()))
  ..single((scope) => WordPressRepository(scope.get()));
