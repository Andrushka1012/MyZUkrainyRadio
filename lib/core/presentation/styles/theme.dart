import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';

import 'colors.dart';
import 'dimens.dart';

ThemeData createTheme(BuildContext context) => ThemeData(
      primaryColor: AppColors.primary,
      unselectedWidgetColor: AppColors.white,
      backgroundColor: AppColors.background,
      scaffoldBackgroundColor: AppColors.white,
      errorColor: AppColors.redTart,
      cardColor: AppColors.secondary,
      buttonTheme: const ButtonThemeData(height: Dimens.spanSmallerGiant, buttonColor: AppColors.primary),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.secondary,
      ),
      inputDecorationTheme: _inputDecorationTheme(),
    );

InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
      alignLabelWithHint: true,
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.secondary, width: 2)),
      focusColor: AppColors.secondary,
      contentPadding: const EdgeInsets.only(bottom: 8),
      labelStyle: AppTextStyles.bodyText2.copyWith(height: 1, color: AppColors.secondaryDark),
      hintStyle: AppTextStyles.bodyText1.copyWith(height: 1),
      errorStyle: AppTextStyles.caption.copyWith(color: AppColors.redTart),
    );
