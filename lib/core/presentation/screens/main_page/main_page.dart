import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:myzukrainy/core/presentation/base/navigation/koin_page.dart';
import 'package:myzukrainy/core/presentation/screens/main_page/widgets/home_page_header_delegate.dart';
import 'package:myzukrainy/core/presentation/screens/main_page/widgets/home_page_intro_text.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/widgets/share_button.dart';

import 'bloc/main_page_cubit.dart';

class MainPage extends KoinPage<MainPageCubit> {
  static const routeName = 'MainPage';

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: kToolbarHeight * 3,
                  backgroundColor: AppColors.headerColor,
                  floating: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      background: Padding(
                        padding: const EdgeInsets.only(left: Dimens.spanBig, top: kToolbarHeight),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimens.spanBig),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomePageIntroText(),
                              ShareButton(),
                            ],
                          ),
                        ),
                      )),
                ),
                SliverPersistentHeader(
                  delegate: CommunitiesIntroHeaderDelegate(MediaQuery.of(context).padding.top),
                  pinned: true,
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(top: Dimens.spanBig),
              child: MainForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class MainForm extends StatelessWidget {

  late final AudioHandler _audioHandler = get();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 700,
        child: Center(
          child: Text('Tu ma być jakiś zajebisty content, ale go nie ma :P'),
        ),
      ),
    );
  }
}
