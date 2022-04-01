import 'package:cis.myzukrainy/app/main_app.dart';

abstract class AppConfig {
  static late AppConfig value;

  abstract final String defaultDomain;

  AppConfig() {
    value = this;
    MainApp.launchApp();
  }
}