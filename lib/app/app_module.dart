import 'package:dio/dio.dart';
import 'package:koin/koin.dart';
import 'package:myzukrainy/app/config/app_config.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/helpers/app_connectivity.dart';
import 'package:myzukrainy/helpers/preferences/preferences_provider.dart';

final appModule = Module()
  ..single((scope) => PlayerController(
        scope.get(),
        scope.get(),
      ))
  ..single((scope) => AppConnectivity())
  ..single((scope) => PreferencesProvider())
  ..single((scope) => Dio(
        BaseOptions(
          baseUrl: AppConfig.value.baseUrl,
        ),
      ));
