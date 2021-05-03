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
            name: data[5],
            life: data[6],
            lastEat: data[7],
            lastSleep: data[8],
            lastPlay: data[9],
          ));
        }
      }
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
      final data = response.data.elementAt(0);
      mypet = PetModel(
        color: Colors.green,
        id: data[0],
        imageUrl: data[1],
        sleep: data[2],
        happy: data[3],
        hungry: data[4],
        name: data[5],
        life: data[6],
        lastEat: data[7],
        lastSleep: data[8],
        lastPlay: data[9],
      );
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
