import 'dart:async';

import 'package:dio/dio.dart';

enum ResponseStatus { success, failure }

class SafeResponse<T> {
  late final ResponseStatus status;
  late final T? data;
  late final dynamic error;

  bool get isSuccessful => status == ResponseStatus.success;

  bool get isFailure => status == ResponseStatus.failure;

  T get requiredData =>
      isSuccessful ? data! : throw Exception('Cannot access to requiredData because SafeResponse has failure status');

  dynamic get requiredError =>
      isFailure ? error! : throw Exception('Cannot access to requiredError because SafeResponse has success status');

  SafeResponse.success(this.data) {
    status = ResponseStatus.success;
    error = null;
  }

  SafeResponse.error(this.error) {
    status = ResponseStatus.failure;
    data = null;
  }

  void throwIfNotSuccessful() {
    if (isFailure) {
      throw error!;
    }
  }

  void fold({
    required Function(T data) onSuccess,
    required Function(dynamic data) onError,
  }) {
    if (isSuccessful) {
      onSuccess(requiredData);
    } else {
      onError(requiredError);
    }
  }
}

Future<SafeResponse<T>> fetchSafety<T>(Future<T> Function() request, {Function(dynamic)? onError}) async {
  try {
    final T data = await request();
    return SafeResponse.success(data);
  } catch (error) {
    print(error);

    if (onError != null) {
      onError(error);
    }
    return SafeResponse.error(error);
  }
}
