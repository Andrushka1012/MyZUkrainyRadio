import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Abstract class for base ummadum page. Wrap page with a [BlocProvider] specified to this page
@immutable
abstract class BasePage<T extends BlocBase> extends StatelessWidget {
  BasePage({Key? key})
      : assert(
            T != Bloc,
            'Bloc type should be specified for BasePage.\n'
            'Declare your page as class YOUR_PAGE_CLASS extends BasePage<YOUR_BLOC_TYPE>'),
        super(key: key);

  /// Creates bloc specified to this page
  T createBloc();

  /// Abstract function to provide page content which will be wrapped into [BlocProvider].
  Widget buildPage(BuildContext context);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (ctx) => createBloc(),
        child: buildPage(context),
      );
}
