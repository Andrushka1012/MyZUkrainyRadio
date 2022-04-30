import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin_flutter/koin_flutter.dart';

import 'base_page.dart';

///  Abstract class for base  page with bloc automatically injected from [Koin].
///  Wrap page with a [BlocProvider] specified to this page
@immutable
abstract class KoinPage<T extends BlocBase> extends BasePage<T> {
  const KoinPage({Key? key}) : super(key: key);

  @override
  T createBloc(BuildContext context) {
    final bloc = get<T>();
    initBloc(context, bloc);
    return bloc;
  }

  /// initial callback which called right after bloc initialized
  void initBloc(BuildContext context, T bloc) {}
}
