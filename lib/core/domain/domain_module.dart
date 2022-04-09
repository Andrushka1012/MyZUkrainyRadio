import 'package:koin/koin.dart';
import 'package:myzukrainy/core/domain/use_cases/wordpress_use_case.dart';

final domainModule = Module()..single((scope) => WordPressUseCase(scope.get()));
