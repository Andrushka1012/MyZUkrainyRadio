import 'package:flutter/material.dart';
import 'package:myzukrainy/core/domain/domain_models/word_press_post.dart';
import 'package:myzukrainy/core/presentation/styles/dimens.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';

class WordPressPostItem extends StatelessWidget {
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
                child: Image(
                  image: (post.imageSrc != null
                      ? NetworkImage(post.imageSrc!)
                      : AssetImage('assets/images/cover_white.jpg')) as ImageProvider,
                  fit: BoxFit.fill,
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
