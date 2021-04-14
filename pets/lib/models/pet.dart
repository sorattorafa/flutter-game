import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets/models/state.dart';

class PetModel {
  int id;
  int userId;
  String name;
  String imageUrl;
  Color color;
  PetState? state;

  PetModel({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.userId,
    this.state,
    required this.color,
  });

  PetModel petFromJson(String source) {
    final json = jsonDecode(source);
    return PetModel.fromJson(json);
  }

  String petToJson(PetModel source) {
    final data = source.toJson();
    return jsonEncode(data);
  }
  

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        name: json["name"],
        imageUrl: json["image_url"],
        id: json["id"],
        userId: json["user_id"],
        color: json["color"],
        state: PetState.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "imageUrl": imageUrl,
        "name": name,
        "state": state!.toJson(),
      };
      
}
