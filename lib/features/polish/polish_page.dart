import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/main_page.dart';

class PolishPage extends StatelessWidget {
  static const routeName = 'PolishPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
            child: Container(
              color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('UA'),
          backgroundColor: AppColors.primary,
          onPressed: () => Navigator.pushReplacementNamed(context, MyZUkrainyHomePage.routeName),
        ));
  }
}
