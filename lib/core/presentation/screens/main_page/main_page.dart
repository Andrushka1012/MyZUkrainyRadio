import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myzukrainy/core/presentation/base/navigation/koin_page.dart';
import 'package:myzukrainy/core/presentation/screens/main_page/widgets/home_page_header_delegate.dart';
import 'package:myzukrainy/core/presentation/screens/main_page/widgets/home_page_intro_text.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/widgets/progress_container.dart';
import 'package:myzukrainy/core/presentation/widgets/share_button.dart';
import 'package:myzukrainy/core/presentation/widgets/something_went_wrong_retry.dart';
import 'package:myzukrainy/core/presentation/widgets/word_press/word_press_post_item.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';
import 'package:myzukrainy/helpers/size_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/main_page_cubit.dart';

class MainPage extends KoinPage<MainPageCubit> {
  static const routeName = 'MainPage';

  @override
  void initBloc(MainPageCubit bloc) {
    bloc.init();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: AppColors.headerColor,
            ),
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: kToolbarHeight * (MediaQuery.of(context).isSmallScreen ? 2.5 : 2),
                      backgroundColor: AppColors.headerColor,
                      floating: false,
                      pinned: false,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: false,
                          background: Padding(
                            padding: const EdgeInsets.only(left: Dimens.spanBig, top: kToolbarHeight),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimens.spanBig),
                              child: Stack(
                                children: [
                                  HomePageIntroText(),
                                  Align(
                                    child: ShareButton(),
                                    alignment: MediaQuery.of(context).isSmallScreen
                                        ? Alignment.topRight
                                        : Alignment.centerRight,
                                  ),
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
          ],
        ),
      ),
    );
  }
}

class MainForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocConsumer<MainPageCubit, MainPageState>(
    listener: _handleEvents,
    buildWhen: (_, current) => current is MainPageProcessing || current is MainPageDefault,
    builder: (ctx, state) => ProgressContainer(
      isProcessing: state is MainPageProcessing,
      child: state is MainPageDefault
              ? state.posts.isNotEmpty
                  ? ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ...state.posts
                            .map(
                              (post) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimens.spanMedium),
                                child: WordPressPostItem(
                                  post: post,
                                  onTap: () => launch(post.postUrl),
                                ),
                              ),
                            )
                            .toList(),
                        SizedBox(
                          height: Dimens.spanBig,
                        ),
                      ],
                    )
                  : Center(
                      child: SomethingWentWrongRetry(onRetry: () {
                        BlocProvider.of<MainPageCubit>(context).init();
                      }),
                    )
              : Container(),
    ),
  );

  void _handleEvents(BuildContext context, MainPageState state) {
    if (state is MainPageError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.headerColor,
          content: Text(
            LocaleKeys.somethingWentWrong.tr(),
          ),
        ),
      );
    }
  }
}
