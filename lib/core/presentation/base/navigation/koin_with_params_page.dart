import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin_flutter/koin_flutter.dart';

import 'base_page.dart';

///  Abstract class for base ummadum page with bloc automatically injected from [Koin] and initialized with [params].
///  Wrap page with a [BlocProvider] specified to this page
@immutable
abstract class KoinWithParamsPage<T extends BlocBase, P> extends BasePage<T> {
  P get params;

  @override
  T createBloc() {
    final bloc = getWithParam<T, P>(params);
    initBloc(bloc);
    return bloc;
  }

  /// initial callback which called right after bloc initialized
  void initBloc(T bloc) {}
}
