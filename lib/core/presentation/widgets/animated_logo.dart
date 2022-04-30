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
        size = MediaQuery.of(context).size.width / 1.5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size.width / 3;

    return AnimatedSize(
      curve: Curves.easeIn,
      duration: const Duration(seconds: 1),
      child: Container(color: Colors.red, height: size, width: size,),
    );
  }
}
