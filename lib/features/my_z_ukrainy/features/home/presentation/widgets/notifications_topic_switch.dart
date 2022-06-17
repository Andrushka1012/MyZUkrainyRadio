import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

class NotificationsTopicSwitch extends StatelessWidget {
  const NotificationsTopicSwitch({
    required this.isEnabled,
    required this.onChanged,
  }) : super();

  final bool isEnabled;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.symmetric(horizontal: Dimens.spanMediumLarge, vertical: Dimens.spanSmall),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.notificationsMessage.tr(),
                style: AppTextStyles.bodyText1.copyWith(color: AppColors.headerColor),
              ),
              Switch(
                value: isEnabled,
                onChanged: onChanged,
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
      );
}
