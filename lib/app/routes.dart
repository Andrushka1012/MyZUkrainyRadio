import 'package:flutter/material.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/main_page.dart';
import 'package:myzukrainy/features/player/player_page.dart';
import 'package:myzukrainy/features/polish/features/home/presentation/nadajemy_page.dart';
import 'package:myzukrainy/helpers/circle_reveal_clipper.dart';

import '../features/splash_screen/presentation/splash_screen_page.dart';

final routes = <String, WidgetBuilder>{
  PlayerPage.routeName: (_) => PlayerPage(),
  SplashScreenPage.routeName: (_) => SplashScreenPage(),
};

Route<dynamic>? getGenerateRoutePage(RouteSettings settings) {
  switch (settings.name) {
    case PlRadioPage.routeName:
      return _circularPage(
        settings,
        PlRadioPage(),
        formBottom: true,
        fromCenter: settings.arguments == true,
      );
    case MyZUkrainyHomePage.routeName:
      return _circularPage(
        settings,
        MyZUkrainyHomePage(),
        fromCenter: settings.arguments == true,
      );
    /*case PolishPage.routeName:
      return _materialPage(settings, PolishPage());*/
    default:
      throw Exception('Not screen specified to route ${settings.name}');
  }
}

Route _materialPage(RouteSettings settings, Widget page) => MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => page,
    );

Route _circularPage(
  RouteSettings settings,
  Widget page, {
  bool formBottom = false,
  bool fromCenter = false,
}) =>
    PageRouteBuilder(
      transitionDuration: Duration(milliseconds: fromCenter ? 1500: 1000),
      reverseTransitionDuration: Duration(milliseconds: 1000),
      opaque: false,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var screenSize = MediaQuery.of(context).size;
        Offset center;

        if (fromCenter) {
          center = Offset(screenSize.width / 2, screenSize.height / 2);
        } else if (formBottom) {
          center = Offset(screenSize.width - 100, screenSize.height - 40);
        } else {
          center = Offset(100, screenSize.height - 40);
        }

        double beginRadius = 0.0;
        double endRadius = screenSize.height * 1.2;

        var tween = Tween(begin: beginRadius, end: endRadius);
        var radiusTweenAnimation = animation.drive(tween);

        return ClipPath(
          clipper: CircleRevealClipper(
            radius: radiusTweenAnimation.value,
            center: center,
          ),
          child: child,
        );
      },
    );
