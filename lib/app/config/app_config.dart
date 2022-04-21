import 'package:myzukrainy/app/main_app.dart';

abstract class AppConfig {
  static late AppConfig value;

  abstract final String streamUrl;
  abstract final String baseUrl;
  abstract final String androidNotificationChannelId;
  abstract final String podcastsUrl;
  abstract final String newsUrl;

  AppConfig() {
    value = this;
    MainApp.launchApp();
  }
}