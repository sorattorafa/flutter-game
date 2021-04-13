import 'package:dio/dio.dart';

class UsersServices {
  UsersServices(this._dio);

  final Dio _dio;

  Future<dynamic> makeLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'v1/orders',
      );
      return response.data;
    } on Object catch (error) {
      print(error);
      throw UsersServicesError.UNKNOWN_ERROR;
    }
  }
}

enum UsersServicesError {
  UNKNOWN_ERROR,
}
