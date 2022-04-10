import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myzukrainy/core/domain/domain_models/word_press_post.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';

class WordPressPostItem extends StatelessWidget {
  static const String blankImageBytes =
      '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';


  const WordPressPostItem({
    required this.post,
    required this.onTap,
  });

  final WordPressPost post;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.65,
                child: FadeInImage(
                  image: (post.imageSrc != null
                      ? NetworkImage(post.imageSrc!)
                      : AssetImage('assets/images/cover_white.jpg')) as ImageProvider,
                  fit: BoxFit.fill,
                  placeholder: MemoryImage(base64Decode(blankImageBytes)),
                ),
              ),
              SizedBox(
                height: Dimens.spanSmall,
              ),
              Text(
                post.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.headline3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.spanTiny),
                child: Text(
                  post.shortDescription,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: Dimens.spanSmall,
              ),
            ],
          ),
        ),
      );
}