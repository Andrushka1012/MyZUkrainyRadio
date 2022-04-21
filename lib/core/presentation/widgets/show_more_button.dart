import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spanBig),
          child: Text(
            LocaleKeys.showMore.tr(),
          ),
        ),
      );
}
