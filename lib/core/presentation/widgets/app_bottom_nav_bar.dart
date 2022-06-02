import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myzukrainy/core/presentation/styles/text_styles.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/main_page.dart';
import 'package:myzukrainy/features/polish/features/home/presentation/nadajemy_page.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';
import 'package:myzukrainy/helpers/models/stations.dart';

import '../styles/colors.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.station,
  }) : super();

  final Station station;

  @override
  Widget build(BuildContext context) => BottomAppBar(
        color: AppColors.headerColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/ua_logo.svg',
                      color: station != Station.myZUkrainy ? Colors.white : null,
                    ),
                    onPressed: () {
                      if (station != Station.myZUkrainy) {
                        Navigator.of(context).pushReplacementNamed(MyZUkrainyHomePage.routeName);
                      }
                    },
                  ),
                  Text(
                    LocaleKeys.myZUkrainy.tr(),
                    style: AppTextStyles.bodyText1,
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.people,
                      color: station != Station.nadajemy ? Colors.white : Colors.yellow,
                    ),
                    onPressed: () {
                      if (station != Station.nadajemy) {
                        Navigator.of(context).pushReplacementNamed(NadajemyPage.routeName);
                      }
                    },
                  ),
                  Text(
                    LocaleKeys.nadajamy.tr(),
                    style: AppTextStyles.bodyText1,
                  )
                ],
              )
            ],
          ),
        ),
      );
}
