import 'package:myzukrainy/app/main_app.dart';

abstract class AppConfig {
  static late AppConfig value;

  abstract final String uaStreamUrl;
  abstract final String plStreamUrl;
  abstract final String baseUrl;
  abstract final String androidNotificationChannelId;
  abstract final String podcastsUrl;
  abstract final String newsUrl;

  AppConfig() {
    value = this;
    MainApp.launchApp();
  }
}