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
    final petmodels = [
      PetModel(
          name: 'Rafa',
          id: 1,
          userId: 2,
          imageUrl: 'assets/images/frog/happy.png',
          color: Colors.lightGreen),
    ];
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

  Future<dynamic> addPet() async {
    try {
      //   return Model.fromJson(response.data);
      return PetModel(
          name: 'Rafusco',
          id: 1,
          userId: 2,
          imageUrl: 'assets/images/cat-solid.svg',
          color: Colors.grey);
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
  }
}

enum PetServiceError {
  UNKNOWN_ERROR,
}
