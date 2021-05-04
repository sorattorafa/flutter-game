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
      if (response.data != null) {
        for (final data in response.data) {
          print(['ola', data]);
          final pet = PetModel.fromJson(data);
          petmodels.add(pet);
        }
      } else {}
      return petmodels;
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
  }

  Future<PetModel> addPet(PetModel pet) async {
    try {
      final petJson = pet.toJson();
      PetModel mypet;
      final response =
          await _dio.post('http://127.0.0.1:5000/pets/post', data: petJson);
      final data = response.data;
      mypet = PetModel.fromJson(data);
      return mypet;
    } on Object catch (error) {
      print(error);
      throw PetServiceError.UNKNOWN_ERROR;
    }
  }
}

enum PetServiceError {
  UNKNOWN_ERROR,
}
