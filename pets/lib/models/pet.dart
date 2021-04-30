import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets/models/state.dart';

class PetModel {
  int id;
  int? userId;
  String name;
  String imageUrl;
  Color color;
  PetState? state;
  int happy;
  int hungry;
  int sleep;
  int life;

  PetModel({
    required this.name,
    required this.imageUrl,
    required this.id,
    this.userId,
    this.state,
    required this.color,
    required this.happy,
    required this.hungry,
    required this.sleep,
    required this.life,
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
        happy: json["happy"],
        hungry: json["hungry"],
        sleep: json["sleep"],
        life: json["life"],
        state: PetState.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_url": imageUrl,
        "name": name,
        "hungry": hungry,
        "happy": happy,
        "sleep": sleep,
        "life": life,
      };
}
