import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/widgets/circle_button.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

Future<void> _share() async {
  await FlutterShare.share(
      title: LocaleKeys.myZUkrainy.tr(), text: LocaleKeys.shareMessage.tr(), chooserTitle: LocaleKeys.shareTitle.tr());
}

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RawMaterialButton(
        onPressed: _share,
        elevation: 2.0,
        fillColor: AppColors.darkGray,
        child: Icon(
          Icons.share,
          size: Dimens.spanMediumLarge,
          color: AppColors.white,
        ),
        padding: EdgeInsets.all(Dimens.spanBig),
        shape: CircleBorder(),
      );
}

class CircleShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CircleButton(icon: Icons.share, onTap: _share);
}
