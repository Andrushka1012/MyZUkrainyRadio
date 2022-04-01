import 'package:koin/koin.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';

final appModule = Module()..single((scope) => PlayerController());
