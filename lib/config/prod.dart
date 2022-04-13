import 'package:myzukrainy/config/app_config.dart';

void main() => Prod();

class Prod extends AppConfig {
  @override
  String get streamUrl => 'https://s3.slotex.pl/shoutcast/7480/stream?sid=1';

  @override
  String get androidNotificationChannelId => 'com.cis.myzukrainy.channel.audio';

  @override
  String get baseUrl => 'https://www.myzukrainy.pl';
}
