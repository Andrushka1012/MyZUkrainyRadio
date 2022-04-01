import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:koin/koin.dart';
import 'package:myzukrainy/app/app_module.dart';
import 'package:myzukrainy/app/routes.dart';
import 'package:myzukrainy/core/presentation/presentation_module.dart';
import 'package:myzukrainy/core/presentation/screens/main_page/main_page.dart';
import 'package:myzukrainy/generated/locale_keys.g.dart';

class MainApp extends StatelessWidget {
  static Future launchApp() async {
    _initKoin();
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
        presentationModule,
      ]);
    });
  }

  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.myZUkrainy.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: MainPage.routeName,
      routes: routes,
      onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return getGenerateRoutePage(settings);
        },
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}