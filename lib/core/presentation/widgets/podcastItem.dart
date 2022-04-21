import 'package:flutter/material.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class PodcastItem extends StatelessWidget {
  const PodcastItem({
    required this.title,
    required this.podcastSrc,
    required this.imageSrc,
  });

  final String title;
  final String podcastSrc;
  final String? imageSrc;

  @override
  Widget build(BuildContext context) => Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: InkWell(
          onTap: () {
            launch(podcastSrc);
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Ink.image(
                  image: (imageSrc?.isNotEmpty == true
                      ? NetworkImage(imageSrc!)
                      : AssetImage('assets/images/cover_white.jpg')) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: AppColors.mainPageHeaderColorAlpha2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: Dimens.spanHuge,
                      left: Dimens.spanSmall,
                      right: Dimens.spanSmall,
                      top: Dimens.spanTiny
                    ),
                    child: Row(
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: AppTextStyles.headline1.copyWith(color: Colors.white),
                        ),
                        Spacer(),
                        Container(
                          width: Dimens.spanGiant,
                          height: Dimens.spanGiant,
                          decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
