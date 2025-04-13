import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:study_mate/Core/networking/api_constants.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options.baseUrl = ApiConstants.apiBaseUrl;
    // dio.options.connectTimeout = const Duration(milliseconds: 5000);
    // dio.options.receiveTimeout = const Duration(milliseconds: 3000);
     dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 90,
      ),
    );
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    return await dio.post(endpoint, data: data);
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(endpoint, queryParameters: queryParameters);
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    return await dio.put(endpoint, data: data);
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    return await dio.delete(endpoint, data: data);
  }

  Future<Response> patch(String endpoint, {Map<String, dynamic>? data}) async {
    return await dio.patch(endpoint, data: data);
  }
}