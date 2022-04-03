import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: onTap,
        child: Icon(
          icon,
          size: Dimens.spanHuge,
          color: AppColors.white09,
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shape: CircleBorder(side: BorderSide(color: Colors.red)),
          side: BorderSide(width: 0.8, color: AppColors.white04),
          padding: EdgeInsets.all(Dimens.spanMedium),
        ),
      );
}
