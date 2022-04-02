import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/screens/main_page/main_page.dart';
import 'package:myzukrainy/core/presentation/screens/player/player_page.dart';

final routes = <String, WidgetBuilder>{
  MainPage.routeName: (_) => MainPage(),
  PlayerPage.routeName: (_) => PlayerPage(),
};

Widget getGenerateRoutePage(RouteSettings settings) {
  switch (settings.name) {
  /* case EmailConfirmationPage.ROUTE_NAME:
      return EmailConfirmationPage(settings.arguments! as EmailConfirmationPageArgs);*/
    default:
      throw Exception('Not screen specified to route ${settings.name}');
  }
}
