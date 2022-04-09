import 'package:myzukrainy/config/app_config.dart';

void main() => Prod();

class Prod extends AppConfig {
  @override
  String get streamUrl => 'https://online.nasze.fm:9443/stream';

  @override
  String get androidNotificationChannelId => 'com.cis.myzukrainy.channel.audio';

  @override
  String get baseUrl => 'https://www.myzukrainy.pl';
}
