import 'package:myzukrainy/config/app_config.dart';

void main() => Prod();

class Prod extends AppConfig {
  @override
  String get streamUrl => 'http://stream3.polskieradio.pl:8900/';
  @override
  String get androidNotificationChannelId => 'com.cis.myzukrainy.channel.audio';
}
