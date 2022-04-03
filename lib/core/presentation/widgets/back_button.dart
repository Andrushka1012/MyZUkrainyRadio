import 'package:flutter/material.dart';

import 'circle_button.dart';

class CircleBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CircleButton(
        onTap: () => Navigator.of(context).pop(),
        icon: Icons.arrow_back,
      );
}
