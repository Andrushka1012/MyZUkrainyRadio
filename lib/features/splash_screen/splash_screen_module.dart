import 'package:koin/koin.dart';
import 'package:myzukrainy/features/splash_screen/presentation/bloc/splash_screen_cubit.dart';

final splashScreenModule = Module()
  ..factory((scope) => SplashScreenCubit(
        scope.get(),
        scope.get(),
      ));
