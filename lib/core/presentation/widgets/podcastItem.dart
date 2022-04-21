import 'dart:convert';

import 'package:flutter/material.dart';
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
          onTap: () => launch(podcastSrc),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.65,
                child: FadeInImage(
                  image: (imageSrc?.isNotEmpty == true
                      ? NetworkImage(imageSrc!)
                      : AssetImage('assets/images/cover_white.jpg')) as ImageProvider,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/cover_white.jpg'),
                  imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/images/cover_white.jpg'),
                ),
              ),
              SizedBox(
                height: Dimens.spanSmall,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.headline3,
              ),
            ],
          ),
        ),
      );
}
