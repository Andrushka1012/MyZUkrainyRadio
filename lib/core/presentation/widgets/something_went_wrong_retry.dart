import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

class SomethingWentWrongRetry extends StatelessWidget {
  const SomethingWentWrongRetry({
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image(
            image: AssetImage('assets/images/something_went_wrong.jpg'),
          ),
          ElevatedButton(
            child: Text(LocaleKeys.retryTitle.tr()),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.primary),
            ),
            onPressed: onRetry,
          ),
        ],
      );
}
