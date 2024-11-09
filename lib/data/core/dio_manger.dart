import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'api_endpoint.dart';
import 'api_interceptors.dart';

class DioManager {
  DioManager._();
  static final DioManager getInstance = DioManager._();

  Dio? _dio;
  Dio init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrlEndpoint,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return true;
        },
      ),
    );
    _dio?.interceptors.add(ApiInterceptors());
    return _dio!;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().i(
        'dioGet url: $url header: $header queryParameters: $queryParameters}');

    return await _dio!.get(
      url,
      options: Options(headers: header),
      queryParameters: queryParameters,
    );
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().i('dioPost url: $url');
    Logger().i('dioPost header: $header');
    return await _dio!.post(
      url,
      queryParameters: queryParameters,
      options: Options(headers: header),
      data: body,
      onSendProgress: (count, total) {},
    );
  }

  Future<Response> postForm(
      {required String url,
      Map<String, dynamic>? header,
      Map<String, dynamic>? body,
      Function(int, int)? onSendProgress}) async {
    Logger().i('dioPostForm url: $url');
    Logger().i('dioPostForm header: $header');
    Logger().i('dioPostForm body: $body');

    return await _dio!.post(
      url,
      options: Options(headers: header),
      data: FormData.fromMap(body ?? {}),
      onSendProgress: onSendProgress,
    );
  }

  Future<Response> update({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    return await _dio!.put(url, options: Options(headers: header), data: body);
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    return await _dio!
        .delete(url, options: Options(headers: header), data: body);
  }

  Future<Response> putForm({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    Logger().i('dioPutForm url: $url');
    Logger().i('dioPutForm header: $header');
    Logger().i('dioPutForm body: $body');

    return await _dio!.put(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> patchForm({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    Logger().i('dioPutForm url: $url');
    Logger().i('dioPutForm header: $header');
    Logger().i('dioPutForm body: $body');

    return await _dio!.patch(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> put({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    Logger().i('dioPutForm url: $url');
    Logger().i('dioPutForm header: $header');
    Logger().i('dioPutForm body: $body');

    return await _dio!.put(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response<dynamic>> downloadFile({
    required String url,
    required Map<String, dynamic>? body,
    required Map<String, String> header,
    required String savePath,
  }) {
    Logger().i('dioDownloadFile url: $url');
    Logger().i('dioDownloadFile header: $header');

    return _dio!.download(
      url,
      savePath,
      data: body,
      options: Options(headers: header, responseType: ResponseType.json),
      onReceiveProgress: (received, total) {
        if (total != -1) {
          // Logger().i('${(received / total * 100).toStringAsFixed(0)}%');
        }
      },
    );
  }
}
