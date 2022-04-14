import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:myzukrainy/config/app_config.dart';

class AppConnectivity {
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup(AppConfig.value.streamUrl);
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  Future<bool> checkIsLive() async {
    if (!AppConfig.value.checkIsLive) return true;

    final response = await http.get(Uri.parse(AppConfig.value.streamUrl));
    return response.statusCode < 400;
  }

  void disposeStream() => _controller.close();
}
