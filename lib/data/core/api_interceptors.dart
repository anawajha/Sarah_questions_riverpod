import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/utils/shared_utils.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    Logger().d(
        'onRequest : ${options.path} \n ${options.data} \n ${options.method}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    Logger().i(
      '''onResponse : ${response.statusCode} \n
       URL: ${response.requestOptions.path}''',
    );
    if (response.statusCode == 401) {
      SharedUtils().endSession();
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    Logger().e('onError : ${err.message}');
  }
}
