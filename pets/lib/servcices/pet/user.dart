import 'package:dio/dio.dart';
import 'package:pets/models/user.dart';

class UsersServices {
  UsersServices(this._dio);

  final Dio _dio;

  Future<dynamic> makeLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/hello',
      );
      return response.data;
    } on Object catch (error) {
      print(error);
      throw UsersServicesError.INVALID_CREDENTIALS;
    }
  }

  Future<dynamic> createUser(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/hello',
          data: UserModel(email: email, password: password));
      return response.data;
    } on Object catch (error) {
      print(error);
      throw UsersServicesError.INVALID_CREDENTIALS;
    }
  }
}

enum UsersServicesError {
  UNKNOWN_ERROR,
  INVALID_CREDENTIALS,
}
