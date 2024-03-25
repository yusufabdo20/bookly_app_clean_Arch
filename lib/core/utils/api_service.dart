import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    print("In GET API SERVICE");
    var response = await _dio.get('$_baseUrl$endPoint',
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
    return response.data;
  }
}
