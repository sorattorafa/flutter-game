//import 'dart:convert';

import 'package:flutter/material.dart';

class PetModel {
  int id;
  int userId;
  String name;
  IconData icon;

  PetModel({
    this.name,
    this.icon,
    this.id,
    this.userId,
  });
/*

Pet petFromJson(String source) {
  final json = jsonDecode(source);
  return Pet.fromJson(json);
}

String petToJson(Pet source) {
  final data = source.toJson();
  return jsonEncode(data);
}
  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        name: json["name"],
        icon: json["icon"],
        id: json["id"],
        userId: json["user_id"],
        state: Normal(
          'normal',
          status: Status(
            health: json["health"],
            hunger: json["hunger"],
            happy: json["happy"],
            dirt: json["dirt"] == 1,
            sleeping: json["sleeping"] == 1,
          ),
          name: json["name"],
          time: DateTime.tryParse(
            json["last_time"],
          ),
        ).update(),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "user_id": userId,
        "icon": icon,
        "name": name,
        "last_time": state.lastTime.toString(),
        "health": state.status.health,
        "happy": state.status.happy,
        "hunger": state.status.hunger,
        "dirt": state.status.dirt,
        "sleeping": state.status.sleeping,
      };
      */
}
