import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/widgets/mini_player/mini_player.dart';

class CommunitiesIntroHeader extends StatelessWidget {
  const CommunitiesIntroHeader(this.topPadding);

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: Dimens.miniPlayerSize / 2,
              child: Container(
                color: AppColors.headerColor,
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: Dimens.miniPlayerSize / 2,
                color: AppColors.background,
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: topPadding,
              ),
              child: MiniPlayer(),
            ),
          ),
        ],
      ),
    );
  }
}

class CommunitiesIntroHeaderDelegate extends SliverPersistentHeaderDelegate {
  CommunitiesIntroHeaderDelegate(this.topPadding);

  final double topPadding;

  @override
  double get minExtent => topPadding + Dimens.miniPlayerSize;

  @override
  double get maxExtent => topPadding + Dimens.miniPlayerSize ;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CommunitiesIntroHeader(topPadding);
  }

  @override
  bool shouldRebuild(CommunitiesIntroHeaderDelegate oldDelegate) {
    return false;
  }
}
