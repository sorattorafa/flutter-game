import 'dart:convert';

import 'package:flutter/material.dart';

class PetState {
  String name;
  DateTime timer;
  int health;
  int hunger;
  int happy;
  bool dirt;
  bool sleeping;
  int id;

  PetState({
    @required this.health,
    @required this.hunger,
    @required this.happy,
    @required this.id,
    @required this.name,
    this.timer,
    this.dirt,
    this.sleeping,
  });

  PetState petStateFromJson(String source) {
    final json = jsonDecode(source);
    return PetState.fromJson(json);
  }

  String petStateToJson(PetState source) {
    final data = source.toJson();
    return jsonEncode(data);
  }

  factory PetState.fromJson(Map<String, dynamic> json) => PetState(
      health: json["health"],
      hunger: json["hunger"],
      happy: json["happy"],
      dirt: json["dirt"] == 1,
      sleeping: json["sleeping"] == 1,
      id: json["id"],
      timer: DateTime.tryParse(
        json["last_time"],
      ),
      name: json["name"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "health": health,
        "hunger": hunger,
        "happy": happy,
        "dirty": dirt,
        "sleeping": sleeping,
        "timer": timer,
        "name": name,
      };
}
