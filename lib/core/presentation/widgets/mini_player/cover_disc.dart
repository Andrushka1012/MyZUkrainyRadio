import 'dart:async';

import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/widgets/measure_size.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

class CoverDisc extends StatefulWidget {

  final double? size;
  final Station station;
  final bool withHero;

  const CoverDisc({
    required this.station,
    this.size,
    this.withHero = true,
  });

  @override
  State<CoverDisc> createState() => _CoverDiscState();
}

class _CoverDiscState extends State<CoverDisc> with SingleTickerProviderStateMixin {
  Size? size;

  late AnimationController _animationController;
  late StreamSubscription playbackSubscription;
  late final PlayerController _playerController = get();

  double get radius => widget.size ?? size?.width ?? 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: _playerController.rotationState,
    );

    playbackSubscription = _playerController.rotationStream.stream.listen((state) {
      _animationController.value = state;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final child = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: MeasureSize(
        onChange: (size) {
          setState(() {
            this.size = size;
          });
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(250.0),
                  child: Container(
                    color: Colors.white,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        widget.station == Station.myZUkrainy
                            ? 'assets/images/cover_white.jpg'
                            : 'assets/images/cover_pl.jpg',
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.station == Station.myZUkrainy) ...[
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
                  child: _CircleItem(
                    radius: radius / 6.9,
                    color: AppColors.headerColor,
                  ),
                ),
              ],
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

    if (!widget.withHero) return child;

    return Hero(
      tag: 'cover',
      createRectTween: (begin, end) => MaterialRectCenterArcTween(begin: begin, end: end),
      child: child,
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
