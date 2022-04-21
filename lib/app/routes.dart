import 'package:flutter/material.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/main_page.dart';
import 'package:myzukrainy/features/player/player_page.dart';

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
