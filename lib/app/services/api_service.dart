import 'package:dio/dio.dart';
import '../utils/logger.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://yourapi.com/api", // Replace with your API base URL
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  );

  String? _authToken;

  void setToken(String token) {
    _authToken = token;

    //...........Update the default headers..........
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  ApiService() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        AppLogger.info("📤 [REQUEST] ${options.method} ${options.path}");
        AppLogger.debug("Headers: ${options.headers}");
        if(_authToken != null){
        // if (options.data != null) { // Uncomment if data is null
          options.headers["Authorization"] = "Bearer $_authToken";
          AppLogger.debug("Body: ${options.data}");
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        AppLogger.info("✅ [RESPONSE] ${response.statusCode} ${response.requestOptions.path}");
        AppLogger.debug("Data: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        AppLogger.error("❌ [ERROR] ${e.message}", error: e, stackTrace: e.stackTrace);
        return handler.next(e);
      },
    ));
  }

  // 🟢 GET Method
  Future<Response?> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      AppLogger.error("GET ERROR: $e");
      return null;
    }
  }

  // 🔵 POST Method
  Future<Response?> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      AppLogger.error("POST ERROR: $e");
      return null;
    }
  }

  // 🟡 PUT Method
  Future<Response?> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      AppLogger.error("PUT ERROR: $e");
      return null;
    }
  }

  // 🔴 DELETE Method
  Future<Response?> delete(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.delete(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      AppLogger.error("DELETE ERROR: $e");
      return null;
    }
  }

  // 🟠 PATCH Method
  Future<Response?> patch(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response;
    } catch (e) {
      AppLogger.error("PATCH ERROR: $e");
      return null;
    }
  }
}
