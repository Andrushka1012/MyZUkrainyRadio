import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

class PlayPauseButton extends StatelessWidget {
  PlayPauseButton({required this.size});

  final double size;
  late final PlayerController _playerController = get();

  @override
  Widget build(BuildContext context) => StreamBuilder<bool>(
      stream: _playerController.isPlayingStream,
      builder: (context, snapshot) {
        return RawMaterialButton(
          onPressed: () => _playPause(context),
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

  Future _playPause(BuildContext context) async {
    final isLiveState = await _playerController.playPause();
    String? errorMessage;

    switch (isLiveState) {
      case ControllerResult.noInternet:
        errorMessage = LocaleKeys.noInternetMessage;
        break;
      case ControllerResult.offline:
        errorMessage = LocaleKeys.radioOfflineMessage;
        break;
      default:
        break;
    }

    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.headerColor,
          content: Text(
            errorMessage.tr(),
          ),
        ),
      );
    }
  }
}
