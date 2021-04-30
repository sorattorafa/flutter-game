//import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pets/models/pet.dart';

class PetService {
  PetService(this._dio);

  final Dio _dio;

  Future<List<PetModel>> listPetsByUser(int userId) async {
    try {
      List<PetModel> petmodels = [];
      final response =
          await _dio.get('http://127.0.0.1:5000/user/pets/$userId');
      if (response.data.length > 0) {
        for (final data in response.data) {
          petmodels.add(PetModel(
              color: Colors.green,
              id: data[0],
              imageUrl: data[1],
              sleep: data[2],
              happy: data[3],
              hungry: data[4],
              name: data[5]));
        }
      }
      return petmodels;
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
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
