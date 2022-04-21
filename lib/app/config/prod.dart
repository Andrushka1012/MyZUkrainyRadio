import 'package:myzukrainy/app/config/app_config.dart';

void main() => Prod();

class Prod extends AppConfig {
  @override
  String get streamUrl => 'https://s3.slotex.pl/shoutcast/7480/stream?sid=1';

  @override
  String get androidNotificationChannelId => 'com.cis.myzukrainy.channel.audio';

  @override
  String get baseUrl => 'https://www.myzukrainy.pl';

  @override
  String get podcastsUrl => 'https://www.myzukrainy.pl/%d0%bf%d0%be%d0%b4%d0%ba%d0%b0%d1%81%d1%82/';

  @override
  String get newsUrl => 'https://www.myzukrainy.pl/';

}
