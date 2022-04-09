import 'package:flutter/material.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({
    required this.isProcessing,
    required this.child,
    this.progressItem,
    this.isDarkBackground = false,
  });

  final bool isProcessing;
  final Widget child;
  final bool isDarkBackground;
  final Widget? progressItem;

  Widget get _progressItem => Center(
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return isProcessing ? progressItem ?? _progressItem : child;
  }
}
