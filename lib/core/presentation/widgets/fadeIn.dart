import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({
    required this.child,
  });

  final Widget child;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  double _opacity = 0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {
        _opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 1000),
      child: widget.child,
    );
  }
}
