import 'package:audio_service/audio_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';
import 'package:myzukrainy/core/presentation/screens/player/player_page.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';
import 'package:myzukrainy/core/presentation/widgets/mini_player/cover_disc.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

class MiniPlayer extends StatelessWidget {
  late final PlayerController _playerController = get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(PlayerPage.routeName),
      child: SizedBox(
        width: double.infinity,
        height: Dimens.miniPlayerSize,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(35))),
            child: Material(
              color: Colors.transparent,
              elevation: 50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CoverDisc(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimens.spanSmall),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.myZUkrainy.tr(),
                                style: AppTextStyles.headline2.copyWith(
                                  color: AppColors.headerColor,
                                ),
                              ),
                              Text('🇵🇱 ❤️ 🇺🇦'),
                            ],
                          ),
                        )
                      ],
                    ),
                    StreamBuilder<PlaybackState>(
                        stream: _playerController.playbackStateStream,
                        builder: (context, snapshot) {
                          return RawMaterialButton(
                            onPressed:
                                snapshot.data?.playing == true ? _playerController.pause : _playerController.play,
                            elevation: 2.0,
                            fillColor: AppColors.primary,
                            child: Icon(
                              snapshot.data?.playing == true ? Icons.pause : Icons.play_arrow,
                              size: Dimens.spanMediumLarge,
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.all(Dimens.spanMedium),
                            shape: CircleBorder(),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
