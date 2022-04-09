import 'package:dio/dio.dart';
import 'package:koin/koin.dart';
import 'package:myzukrainy/config/app_config.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';

final appModule = Module()
  ..single((scope) => PlayerController(scope.get()))
  ..single((scope) => Dio(
        BaseOptions(
          baseUrl: AppConfig.value.baseUrl,
        ),
      ));
