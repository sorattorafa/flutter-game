import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pets/models/pet.dart';

class PetService {
  PetService(this._dio);

  final Dio _dio;

  Future<dynamic> listPetsByUser({
    int page = 1,
    int limit = 20,
  }) async {
    final petmodels = [];
    return petmodels;
    /*
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
      return response.data;
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
    */
  }

  Future<dynamic> addPet(PetModel pet) async {
    try {
      final petJson = pet.toJson();
      print(petJson);
      final response =
          await _dio.post('http://127.0.0.1:5000/pets/post', data: petJson);
      return response.data; 
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
  }
}

enum PetServiceError {
  UNKNOWN_ERROR,
}
