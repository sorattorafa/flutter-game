import 'package:dio/dio.dart';
import 'package:pets/models/user.dart';

class UsersServices {
  final dio = Dio();

  Future<dynamic> makeLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await dio.post('http://127.0.0.1:5000/users/login',
          data: UserModel(email: email, password: password).userModelToJson());
      print(response.data);
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
      final response = await dio.post('http://127.0.0.1:5000/users/signup',
          data: UserModel(email: email, password: password).userModelToJson());
      print(response.data);
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
