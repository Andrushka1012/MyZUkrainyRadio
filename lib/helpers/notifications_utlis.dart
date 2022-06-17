import 'package:flutter/services.dart';

class NotificationsUtils {
  static const _chanelName = 'com.cis.notification_chanel';
  late final MethodChannel _chanel = const MethodChannel(_chanelName);

  Future setUaTopicEnabled(bool isEnabled) async {
    await _chanel.invokeMethod('setUaTopicEnabled', {'isEnabled': isEnabled});
  }
}
