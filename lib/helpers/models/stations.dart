import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

enum Station {
  myZUkrainy,
  aktywni,
}

extension StationExtension on Station {
  static Station fromString(String value) => Station.values.firstWhere(
        (element) => element.toString() == value,
        orElse: () => Station.myZUkrainy,
      );

  String get translation {
    switch (this) {
      case Station.myZUkrainy:
        return LocaleKeys.myZUkrainy;
      case Station.aktywni:
        return LocaleKeys.nadajamy;
    }
  }

  String get shareMessage {
    switch (this) {
      case Station.myZUkrainy:
        return LocaleKeys.shareMessage;
      case Station.aktywni:
        return LocaleKeys.shareMessagePl;
    }
  }

  List<Color> get colors {
    switch (this) {
      case Station.myZUkrainy:
        return [
          Colors.blue,
          Colors.blue,
          Colors.blue,
          Colors.yellow,
          Colors.yellow,
          Colors.yellow,
        ];
      case Station.aktywni:
        return [
          Colors.white,
          AppColors.plPrimary,
          AppColors.plPrimary,
        ];
    }
  }
}
