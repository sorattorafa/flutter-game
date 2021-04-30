import 'package:dio/dio.dart';
import 'package:pets/models/user.dart';

//import 'package:flutter/material.dart';

class UsersServices {
  UsersServices(this._dio);

  final Dio _dio;

  Future<dynamic> makeLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post('http://127.0.0.1:5000/users/login',
          data: UserModel(email: email, password: password).userModelToJson());
      print(response.data);
      return response.data;
    } on Object catch (error) {
      if (error is DioError) {
        throw UsersServicesError.INVALID_CREDENTIALS;
      }
      throw UsersServicesError.UNKNOWN_ERROR;
    }
  }

  Future<dynamic> createUser(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post('http://127.0.0.1:5000/users/signup',
          data: UserModel(email: email, password: password).userModelToJson());
      print(response.data);
      return response.data;
    } on Object catch (error) {
      if (error is DioError) {
        throw UsersServicesError.INVALID_CREDENTIALS;
      }
      throw UsersServicesError.UNKNOWN_ERROR;
    }
  }

  Future<dynamic> getPetsByUser(int userId) async {
    try {
      final response = await _dio.get('http://127.0.0.1:5000/user/pets');
      print(response.data);
      return response.data;
    } on Object catch (error) {
      if (error is DioError) {
        throw UsersServicesError.INVALID_CREDENTIALS;
      }
      throw UsersServicesError.UNKNOWN_ERROR;
    }
  }
}

enum UsersServicesError {
  UNKNOWN_ERROR,
  INVALID_CREDENTIALS,
}
