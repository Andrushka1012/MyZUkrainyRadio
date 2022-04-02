import 'package:myzukrainy/app/main_app.dart';

abstract class AppConfig {
  static late AppConfig value;

  abstract final String streamUrl;
  abstract final String androidNotificationChannelId;

  AppConfig() {
    value = this;
    MainApp.launchApp();
  }
}