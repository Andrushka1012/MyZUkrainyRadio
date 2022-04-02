import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimens.miniPlayerSize,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(35))),
          padding: const EdgeInsets.only(bottom: Dimens.spanSmall),
          child: Material(
            color: Colors.transparent,
            elevation: 50,
            child: Container(),
          ),
        ),
      ),
    );
  }
}
