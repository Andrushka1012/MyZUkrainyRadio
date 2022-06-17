import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:myzukrainy/app/config/app_config.dart';
import 'package:myzukrainy/core/domain/player/player_controller.dart';

class AppConnectivity {
  final _connectivity = Connectivity();
  final StreamController<bool> _controller = StreamController.broadcast();

  Stream<bool> get connectionStream => _controller.stream.distinct();

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
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add(isOnline);
  }

  Future<ControllerResult> checkIsLive() async {
    try {
      var request = CloseableMultipartRequest("GET", Uri.parse(AppConfig.value.uaStreamUrl));
      final streamedResponse = await request.send();
      request.close();

      return streamedResponse.statusCode < 400 ? ControllerResult.live : ControllerResult.offline;
    } catch (_) {
      return ControllerResult.noInternet;
    }
  }

  void disposeStream() => _controller.close();
}

class CloseableMultipartRequest extends http.MultipartRequest {
  IOClient client = IOClient(HttpClient());

  CloseableMultipartRequest(String method, Uri uri) : super(method, uri);

  void close() => client.close();

  @override
  Future<http.StreamedResponse> send() async {
    try {
      var response = await client.send(this);
      var stream = onDone(response.stream, client.close);
      return http.StreamedResponse(
        http.ByteStream(stream),
        response.statusCode,
        contentLength: response.contentLength,
        request: response.request,
        headers: response.headers,
        isRedirect: response.isRedirect,
        persistentConnection: response.persistentConnection,
        reasonPhrase: response.reasonPhrase,
      );
    } catch (_) {
      client.close();
      rethrow;
    }
  }

  Stream<List<int>> onDone<T>(Stream<T> stream, void Function() onDone) =>
      stream.transform(StreamTransformer.fromHandlers(handleDone: (sink) {
        sink.close();
        onDone();
      }));
}
