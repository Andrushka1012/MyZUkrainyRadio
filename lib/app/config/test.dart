import 'package:myzukrainy/app/config/prod.dart';

void main() => Test();

class Test extends Prod {
  @override
  String get uaStreamUrl => 'https://online.nasze.fm:9443/stream';
  @override
  String get plStreamUrl => 'https://online.nasze.fm:9443/stream';
}
