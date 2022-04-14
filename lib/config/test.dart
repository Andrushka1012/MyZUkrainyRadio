import 'package:myzukrainy/config/app_config.dart';

void main() => Test();

class Test extends AppConfig {
  @override
  String get streamUrl => 'https://online.nasze.fm:9443/stream';

  @override
  String get androidNotificationChannelId => 'com.cis.myzukrainy.channel.audio';

  @override
  String get baseUrl => 'https://www.myzukrainy.pl';

  @override
  bool get checkIsLive => false;
}
