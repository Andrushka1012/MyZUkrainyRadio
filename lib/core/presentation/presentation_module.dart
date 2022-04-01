import 'package:koin/koin.dart';
import 'package:myzukrainy/core/presentation/screens/main_page/bloc/main_page_cubit.dart';

final presentationModule = Module()
    ..factory((scope) => MainPageCubit());