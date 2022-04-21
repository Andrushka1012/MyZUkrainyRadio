import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

class HomePageIntroText extends StatelessWidget {
  String get _timedWelcomeMessage {
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;

    if (currentHour >= 5 && currentHour < 12) return LocaleKeys.goodMorning;
    if (currentHour >= 12 && currentHour < 17) return LocaleKeys.goodAfternoon;
    return LocaleKeys.goodEvening;
  }

  @override
  Widget build(BuildContext context) => RichText(
        textAlign: TextAlign.start,
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        text: TextSpan(children: [
          TextSpan(
            text: '${_timedWelcomeMessage.tr()},\n',
            style: AppTextStyles.headline1,
          ),
          TextSpan(
            text: LocaleKeys.myZUkrainy.tr(),
            style: AppTextStyles.headline0,
          ),
        ]),
      );
}
