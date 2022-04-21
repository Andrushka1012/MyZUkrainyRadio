import 'package:flutter/material.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/main_page.dart';
import 'package:myzukrainy/features/player/player_page.dart';
import 'package:myzukrainy/features/polish/polish_page.dart';
import 'package:myzukrainy/helpers/circle_reveal_clipper.dart';

final routes = <String, WidgetBuilder>{
  PlayerPage.routeName: (_) => PlayerPage(),
};

Route<dynamic>? getGenerateRoutePage(RouteSettings settings) {
  switch (settings.name) {
    case PolishPage.routeName:
      return _circularPage(settings, PolishPage());
    case MyZUkrainyHomePage.routeName:
      return _circularPage(settings, MyZUkrainyHomePage(), formBottom: false);
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

Route _circularPage(RouteSettings settings, Widget page, {bool formBottom = true}) => PageRouteBuilder(
  transitionDuration: Duration(milliseconds: 1000),
  reverseTransitionDuration: Duration(milliseconds: 1000),
  opaque: false,
  barrierDismissible: false,
  pageBuilder: (context, animation, secondaryAnimation) => page,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    var screenSize = MediaQuery.of(context).size;
    Offset center = Offset(screenSize.width - 40, formBottom ? screenSize.height - 40 : 100);
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
