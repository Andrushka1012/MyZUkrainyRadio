import 'package:myzukrainy/config/app_config.dart';

void main() => Prod();

class Prod extends AppConfig {
  @override
  String get defaultDomain => '';
}
