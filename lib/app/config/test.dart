import 'package:myzukrainy/app/config/prod.dart';

void main() => Test();

class Test extends Prod {
  @override
  String get streamUrl => 'https://online.nasze.fm:9443/stream';
}
