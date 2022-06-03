import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myzukrainy/core/presentation/base/navigation/koin_page.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:myzukrainy/features/player/player_page.dart';
import 'package:myzukrainy/features/polish/features/home/presentation/bloc/nadajemy_home_cubit.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

class PlRadioPage extends KoinPage<PrRadioHomeCubit> {
  static const routeName = 'NadajemyPage';

  @override
  void initBloc(BuildContext context, PrRadioHomeCubit bloc) {
    bloc.init();

    Future.delayed(Duration(milliseconds: 750)).then(
      (value) => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: AppColors.headerColor,
          systemNavigationBarColor: AppColors.headerColor,
        ),
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PrRadioHomeCubit, NadajemyHomeState>(builder: (ctx, s) {
        return PlayerForm(
          station: Station.aktywni,
        );
      }),
      backgroundColor: AppColors.headerColor,
      bottomNavigationBar: AppBottomNavBar(
        station: Station.aktywni,
      ),
    );
  }
}
