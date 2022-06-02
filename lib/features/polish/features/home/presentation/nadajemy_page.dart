import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myzukrainy/core/presentation/base/navigation/koin_page.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:myzukrainy/features/polish/features/home/presentation/bloc/nadajemy_home_cubit.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

class NadajemyPage extends KoinPage<NadajemyHomeCubit> {
  static const routeName = 'NadajemyPage';

  @override
  void initBloc(BuildContext context, NadajemyHomeCubit bloc) {
    bloc.init();

    Future.delayed(Duration(milliseconds: 750)).then(
      (value) => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: AppColors.white,
          systemNavigationBarColor: AppColors.headerColor,
        ),
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NadajemyHomeCubit, NadajemyHomeState>(builder: (ctx, s) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: AppBottomNavBar(
        station: Station.nadajemy,
      ),
    );
  }
}
