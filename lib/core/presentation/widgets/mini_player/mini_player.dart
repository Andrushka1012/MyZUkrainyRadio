import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';
import 'package:myzukrainy/core/presentation/widgets/mini_player/cover_disc.dart';
import 'package:myzukrainy/core/presentation/widgets/play_pause_button.dart';
import 'package:myzukrainy/features/player/player_page.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

class MiniPlayer extends StatelessWidget {

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
                padding: const EdgeInsets.all(11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CoverDisc(
                          station: Station.myZUkrainy,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimens.spanSmall,
                          ),
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
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PlayPauseButton(
                          size: Dimens.spanMediumLarge,
                        ),
                      ),
                    ),
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
