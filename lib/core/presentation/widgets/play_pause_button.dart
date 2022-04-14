import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';

class PlayPauseButton extends StatelessWidget {
  PlayPauseButton({required this.size});

  final double size;
  late final PlayerController _playerController = get();

  @override
  Widget build(BuildContext context) => StreamBuilder<bool>(
      stream: _playerController.isPlayingStream,
      builder: (context, snapshot) {
        return RawMaterialButton(
          onPressed: _playerController.playPause,
          elevation: 2.0,
          fillColor: AppColors.primary,
          child: Icon(
            snapshot.data == true ? Icons.pause : Icons.play_arrow,
            size: size,
            color: AppColors.white,
          ),
          padding: EdgeInsets.all(Dimens.spanMedium),
          shape: CircleBorder(),
        );
      });
}
