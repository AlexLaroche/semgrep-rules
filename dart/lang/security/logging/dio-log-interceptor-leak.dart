import 'package:dio/dio.dart';

class HttpClientFactory {
  Dio buildLeakyBody() {
    final dio = Dio();
    // ruleid: dio-log-interceptor-leak
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  Dio buildLeakyResponseBody() {
    final dio = Dio();
    // ruleid: dio-log-interceptor-leak
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }

  Dio buildLeakyRequestHeader() {
    final dio = Dio();
    // ruleid: dio-log-interceptor-leak
    dio.interceptors.add(LogInterceptor(requestHeader: true));
    return dio;
  }

  Dio buildLeakyResponseHeader() {
    final dio = Dio();
    // ruleid: dio-log-interceptor-leak
    dio.interceptors.add(LogInterceptor(responseHeader: true));
    return dio;
  }

  Dio buildSafeDefaults() {
    final dio = Dio();
    // ok: dio-log-interceptor-leak
    dio.interceptors.add(LogInterceptor());
    return dio;
  }

  Dio buildSafeBodiesOff() {
    final dio = Dio();
    // ok: dio-log-interceptor-leak
    dio.interceptors.add(LogInterceptor(requestBody: false, responseBody: false));
    return dio;
  }

  // The escape hatch documented in the rule message: a `kDebugMode`
  // guard tree-shakes the interceptor out of release builds.
  Dio buildDebugOnlyLeaky() {
    final dio = Dio();
    if (kDebugMode) {
      // ok: dio-log-interceptor-leak
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dio;
  }
}
