import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/widgets/circle_button.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

Future<void> _share(Station station) async {

  await FlutterShare.share(
    title: station.translation,
    text: station.shareMessage,
    chooserTitle: LocaleKeys.shareTitle.tr(),
  );
}

class ShareButton extends StatelessWidget {
  const ShareButton({required this.station});

  final Station station;

  @override
  Widget build(BuildContext context) => RawMaterialButton(
        onPressed: () => _share(station),
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
  const CircleShareButton({required this.station});

  final Station station;

  @override
  Widget build(BuildContext context) => CircleButton(icon: Icons.share, onTap: () => _share(station));
}
