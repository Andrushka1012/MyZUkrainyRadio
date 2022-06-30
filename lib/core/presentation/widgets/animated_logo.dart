import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

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
      child: SvgPicture.asset(
        'assets/images/ic_launcher.svg',
      ),
    );
  }
}
