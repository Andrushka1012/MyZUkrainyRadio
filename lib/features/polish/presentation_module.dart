import 'package:koin/koin.dart';
import 'package:myzukrainy/features/polish/features/home/presentation/bloc/nadajemy_home_cubit.dart';

final nadajemyPresentationModule = Module()
  ..factory((scope) => PrRadioHomeCubit(
        scope.get(),
        scope.get(),
      ));
