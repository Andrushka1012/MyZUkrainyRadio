import 'package:flutter/cupertino.dart';

extension MediaQueryExtension on MediaQueryData {
  bool get isSmallScreen => size.height < 680;
}