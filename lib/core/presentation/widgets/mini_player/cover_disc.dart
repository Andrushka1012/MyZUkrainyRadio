import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:koin_flutter/koin_flutter.dart';

class CoverDisc extends StatefulWidget {

  final double size;

  const CoverDisc(this.size);

  @override
  State<CoverDisc> createState() => _CoverDiscState();
}

class _CoverDiscState extends State<CoverDisc> with SingleTickerProviderStateMixin {
  Size? size;

  late AnimationController _animationController;
  late StreamSubscription playbackSubscription;
  late final PlayerController _playerController = get();

  double get radius => widget.size;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _animationController.repeat();

    playbackSubscription = _playerController.playbackStateStream.listen((state) {
      if (state.playing) {
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'cover',
      createRectTween: (begin, end) => MaterialRectCenterArcTween(begin: begin, end: end),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(250.0),
                  child: Image(
                    image: AssetImage('assets/images/cover_white.jpg'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: _CircleItem(
                  radius: radius / 6.9,
                  color: AppColors.headerColor,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: _CircleItem(
                  radius: radius / 5.3,
                  color: AppColors.mainPageHeaderColorAlpha2,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: _CircleBorderItem(
                  radius: radius / 4.6,
                  color: AppColors.mainPageHeaderColorAlpha1,
                  width: radius / 70,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: _CircleBorderItem(
                  radius: radius / 2.7,
                  color: AppColors.mainPageHeaderColorAlpha2,
                  width: radius / 13,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: _CircleBorderItem(
                  radius: radius / 1.06,
                  color: AppColors.mainPageHeaderColorAlpha1,
                  width: radius / 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    playbackSubscription.cancel();
    _animationController.dispose();
    super.dispose();
  }
}

class _CircleItem extends StatelessWidget {
  const _CircleItem({
    required this.radius,
    required this.color,
    Key? key,
  }) : super(key: key);

  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    height: radius,
    width: radius,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}

class _CircleBorderItem extends StatelessWidget {
  const _CircleBorderItem({
    required this.radius,
    required this.width,
    required this.color,
    Key? key,
  }) : super(key: key);

  final double radius;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    height: radius,
    width: radius,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(200)),
      border: Border.all(
        width: width,
        color: color,
        style: BorderStyle.solid,
      ),
    ),
  );
}
