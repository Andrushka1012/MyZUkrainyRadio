import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/widgets/mini_player/cover_disc.dart';

class PlayerPage extends StatelessWidget {
  static const routeName = 'PlayerPage';


  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.headerColor,
    body: PlayerForm(),
  );
}


class PlayerForm extends StatelessWidget {
  const PlayerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CoverDisc(size: MediaQuery.of(context).size.width),
    );
  }
}
