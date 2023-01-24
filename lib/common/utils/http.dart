import 'dart:developer';

import 'package:dio/dio.dart';

class HttpUtils {
  static HttpUtils _instance = HttpUtils._internal();
  factory HttpUtils() => _instance;
  late Dio dio;
  CancelToken cancelToken = CancelToken();
  HttpUtils._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: 'SERVER_API_URL',
        connectTimeout: 10000,
        receiveTimeout: 5000,
        headers: {});
  }
  get(String url) async {
    try {
      Response response = await dio.get(url);
      return response.data;
    } catch (e) {
      log("Utils Location Get $e");
    }
  }
}
