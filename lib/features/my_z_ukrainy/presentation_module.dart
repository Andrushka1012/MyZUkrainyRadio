import 'package:koin/koin.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/bloc/main_page_cubit.dart';

final myZUkrainyPresentationModule = Module()
  ..factory((scope) => MainPageCubit(
        scope.get(),
      ));
