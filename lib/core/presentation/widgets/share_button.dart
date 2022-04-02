import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RawMaterialButton(
        onPressed: () {},
        elevation: 2.0,
        fillColor: AppColors.darkGray,
        child: Icon(
          Icons.share,
          size: Dimens.spanMediumLarge,
          color: AppColors.white,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      );
}
