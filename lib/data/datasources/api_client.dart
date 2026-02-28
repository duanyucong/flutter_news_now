import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  
  late final Dio _dio;
  
  ApiClient._internal() {
    _dio = Dio(BaseOptions(
      // baseUrl: 'http://124.222.255.137:12233',
      baseUrl: 'https://newsnow.busiyi.world',
      // baseUrl: 'http://192.168.1.18:12233',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8',
        'User-Agent': 'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36',
        'Referer': 'https://newsnow.busiyi.world/',
        'Origin': 'https://newsnow.busiyi.world',
      },
    ));
    
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      logPrint: (obj) => print('Dio: $obj'),
    ));
  }
  
  Dio get dio => _dio;
  
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.get<T>(path, queryParameters: queryParameters, options: options);
  }
  
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.post<T>(path, data: data, queryParameters: queryParameters, options: options);
  }
}
