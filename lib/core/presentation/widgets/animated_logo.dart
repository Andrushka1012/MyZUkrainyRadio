import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  double? size;


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        size = MediaQuery.of(context).size.width / 1.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size.width / 3;

    return AnimatedContainer(
      curve: Curves.easeIn,
      height: size,
      width: size,
      duration: const Duration(milliseconds: 1200),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
        'assets/images/cover_white.jpg',
      ))),
    );
  }
}
