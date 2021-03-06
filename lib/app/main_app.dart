import 'package:audio_service/audio_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koin/internals.dart';
import 'package:koin/koin.dart';
import 'package:myzukrainy/app/app_module.dart';
import 'package:myzukrainy/app/config/app_config.dart';
import 'package:myzukrainy/app/routes.dart';
import 'package:myzukrainy/core/domain/player/audio_handler.dart';
import 'package:myzukrainy/core/presentation/styles/colors.dart';
import 'package:myzukrainy/features/my_z_ukrainy/data/data_module.dart';
import 'package:myzukrainy/features/my_z_ukrainy/domain/domain_module.dart';
import 'package:myzukrainy/features/my_z_ukrainy/features/home/presentation/main_page.dart';
import 'package:myzukrainy/features/my_z_ukrainy/presentation_module.dart';
import 'package:myzukrainy/features/splash_screen/presentation/splash_screen_page.dart';
import 'package:myzukrainy/features/splash_screen/splash_screen_module.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';
import 'package:myzukrainy/helpers/scroll_configuration.dart';

import '../features/polish/presentation_module.dart';

class MainApp extends StatelessWidget {
  static Future launchApp() async {
    _initKoin();

    final audioHandler = await AudioService.init(
      builder: () {
        final handler = AudioPlayerHandler();
        KoinContextHandler.get().declare<AudioPlayerHandler>(handler);

        return handler;
      },
      config: AudioServiceConfig(
        androidNotificationChannelId: AppConfig.value.androidNotificationChannelId,
        androidNotificationChannelName: 'Radio playback',
        androidNotificationOngoing: true,
        androidShowNotificationBadge: true,
      ),
    );
    KoinContextHandler.get().declare<AudioHandler>(audioHandler);

    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    EasyLocalization.logger.enableLevels = [];
    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('uk'),
          Locale('pl'),
        ],
        path: 'assets/translations',
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        fallbackLocale: const Locale('uk'),
        child: const MainApp(),
      ),
    );
  }

  static void _initKoin() {
    startKoin((app) {
      app.printLogger(level: Level.debug);
      app.modules([
        appModule,
        myZUkrainyPresentationModule,
        nyZUkrainyDataModule,
        myZUkrainyDomainModule,
        splashScreenModule,
        nadajemyPresentationModule,
      ]);
    });
  }

  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LocaleKeys.myZUkrainy.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: SplashScreenPage.routeName,
      routes: routes,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: AppScrollBehavior(),
          child: child ?? Container(),
        );
      },
      onGenerateRoute: getGenerateRoutePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}