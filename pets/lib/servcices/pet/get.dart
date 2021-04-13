import 'dart:convert';
import 'package:dio/dio.dart';

class PetService {
  PetService(this._dio);

  final Dio _dio;

  Future<dynamic> listPetsByUser({
    int page = 1,
    int limit = 20,
    List<String> status,
    String name,
  }) async {
    final queryParameters = <String, dynamic>{
      'page': page,
      'limit': limit,
      'order': jsonEncode([
        {'updated_at': 'desc'}
      ]),
    };

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'v1/orders',
        queryParameters: queryParameters,
      );
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
  }

  Future<dynamic> makeLogin(
    String email,
    String password,
  ) async {
    try {
      //   return Model.fromJson(response.data);
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
  }
}

enum PetServiceError {
  UNKNOWN_ERROR,
}
