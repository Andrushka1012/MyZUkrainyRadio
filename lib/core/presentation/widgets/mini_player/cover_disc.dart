import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/widgets/measure_size.dart';

class CoverDisc extends StatefulWidget {
  @override
  State<CoverDisc> createState() => _CoverDiscState();
}

class _CoverDiscState extends State<CoverDisc> {
  Size? size;

  double get radius => size?.width ?? 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: MeasureSize(
        onChange: (newSize) {
          setState(() {
            size = newSize;
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150.0),
                child: Image(
                  image: AssetImage('assets/images/cover_white.jpg'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _CircleItem(
                radius: radius / 6.9,
                color: AppColors.mainPageHeaderColor,
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
                width: 4,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _CircleBorderItem(
                radius: radius / 2.7,
                color: AppColors.mainPageHeaderColorAlpha2,
                width: radius / 13.4,
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
    );
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
          borderRadius: BorderRadius.all(Radius.circular(120)),
          border: Border.all(
            width: width,
            color: color,
            style: BorderStyle.solid,
          ),
        ),
      );
}
