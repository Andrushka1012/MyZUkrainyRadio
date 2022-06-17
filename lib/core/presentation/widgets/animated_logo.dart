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
        size = MediaQuery.of(context).size.width / 1.3;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size.width / 2.4;

    return AnimatedContainer(
      curve: Curves.easeIn,
      height: size,
      width: size,
      duration: const Duration(milliseconds: 900),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/ic_launcher.png',
          ),
        ),
      ),
    );
  }
}
