import 'package:flutter/material.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/core/presentation/base/navigation/koin_page.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'bloc/main_page_cubit.dart';

class MainPage extends KoinPage<MainPageCubit> {
  static const routeName = 'MainPage';

  @override
  Widget buildPage(BuildContext context) => Scaffold(
        body: MainForm(),
      );
}

class MainForm extends StatelessWidget {

  late final PlayerController _playerController = get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300,),
        FlatButton(
          child: Text('play'),
          onPressed: () {

            _playerController.play();
          },
        ),
        FlatButton(
          child: Text('pause'),
          onPressed: () {

            _playerController.pause();
          },
        ),
        FlatButton(
          child: Text('stop'),
          onPressed: () {

            _playerController.stop();
          },
        ),
      ],
    );
  }
}
