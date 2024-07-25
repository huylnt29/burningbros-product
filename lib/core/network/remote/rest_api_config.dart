import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:burningbros_product/core/network/remote/rest_api_interceptor.dart';
import 'rest_api_client.dart';

class RestApiConfig {
  static Dio initApiService({String? baseUrl}) {
    final dio = Dio();
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    dio.interceptors.add(RestApiInterceptor(dio: dio));
    dio.options.connectTimeout = const Duration(seconds: 120);
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['Accept'] = 'application/json';

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

    return dio;
  }

  static RestApiClient getRestApiClient() {
    final restApiClient = RestApiClient(initApiService());
    return restApiClient;
  }
}
