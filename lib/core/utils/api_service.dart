import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = "https://www.googleapis.com/books/v1/";
  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get(String endPoint) async {
    final response = await _dio.get(baseUrl + endPoint);
    return response.data;
  }
}
