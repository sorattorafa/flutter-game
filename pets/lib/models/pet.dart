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
  int? clean;
  String? lastUpdated;

  PetModel(
      {required this.name,
      required this.imageUrl,
      required this.id,
      this.userId,
      this.state,
      required this.color,
      required this.happy,
      required this.hungry,
      required this.sleep,
      required this.life,
      required this.lastUpdated,
      required this.clean});

  PetModel petFromJson(String source) {
    final json = jsonDecode(source);
    return PetModel.fromJson(json);
  }

  String petToJson(PetModel source) {
    final data = source.toJson();
    return jsonEncode(data);
  }

  factory PetModel.fromJson(dynamic json) => PetModel(
      name: json["name"],
      imageUrl: json["image_url"],
      id: json["id"],
      userId: json["user_id"],
      color: Colors.green,
      happy: json["happy"],
      hungry: json["hungry"],
      sleep: json["sleep"],
      life: json["life"],
      lastUpdated: json["last_updated"],
      clean: json["clean"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image_url": imageUrl,
        "name": name,
        "hungry": hungry,
        "happy": happy,
        "sleep": sleep,
        "life": life,
        "last_updated": lastUpdated,
      };
}
