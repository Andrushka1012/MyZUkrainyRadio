import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:myzukrainy/core/presentation/base/navigation/koin_page.dart';

import 'bloc/main_page_cubit.dart';

class MainPage extends KoinPage<MainPageCubit> {
  static const routeName = 'MainPage';

  @override
  Widget buildPage(BuildContext context) => Scaffold(
        body: MainForm(),
      );
}

class MainForm extends StatelessWidget {

  late final AudioHandler _audioHandler = get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
        ),
        FlatButton(
          child: Text('play'),
          onPressed: () {
            _audioHandler.play();
          },
        ),
        FlatButton(
          child: Text('pause'),
          onPressed: () {
            _audioHandler.pause();
          },
        ),
        FlatButton(
          child: Text('stop'),
          onPressed: () {
            _audioHandler.stop();
          },
        ),
      ],
    );
  }
}
