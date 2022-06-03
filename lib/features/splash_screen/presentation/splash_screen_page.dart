import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myzukrainy/core/presentation/base/navigation/koin_page.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/widgets/animated_logo.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/main_page.dart';
import 'package:myzukrainy/features/polish/features/home/presentation/nadajemy_page.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

import 'bloc/splash_screen_cubit.dart';

class SplashScreenPage extends KoinPage<SplashScreenCubit> {
  static const routeName = 'SplashScreenPage';

  @override
  void initBloc(BuildContext context, SplashScreenCubit bloc) {
    bloc.init(Localizations.localeOf(context));
  }

  @override
  Widget buildPage(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));

    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: _handleEvents,
        child: InteractiveViewer(
          panEnabled: false,
          // Set it to false to prevent panning.
          boundaryMargin: EdgeInsets.all(80),
          minScale: 0.5,
          maxScale: 4,
          child: Center(
            child: AnimatedLogo(),
          ),
        ),
      ),
    );
  }

  void _handleEvents(BuildContext context, SplashScreenState state) {
    state.maybeMap(
      ready: (readyState) {
        switch (readyState.selectedStation) {
          case Station.myZUkrainy:
            Navigator.of(context).pushReplacementNamed(MyZUkrainyHomePage.routeName, arguments: true);
            break;
          case Station.aktywni:
            Navigator.of(context).pushReplacementNamed(PlRadioPage.routeName, arguments: true);
            break;
        }
      },
      orElse: () {},
    );
  }
}
