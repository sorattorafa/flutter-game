import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';

class PetModel {
  int id;
  int? userId;
  String name;
  String imageUrl;
  Color color;
  String? state;
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

  bool isFrog() => this.imageUrl.contains('frog');
  bool isDog() => this.imageUrl.contains('dog');
  bool isFish() => this.imageUrl.contains('fish');
  bool isCat() => this.imageUrl.contains('cat');

  void petAction(String action) {
    if (action == 'kill') {
      if (this.isCat()) {
        this.imageUrl = 'assets/images/cat/dead.png';
      } else if (this.isDog()) {
        this.imageUrl = 'assets/images/dog/dead.png';
      } else if (this.isFish()) {
        this.imageUrl = 'assets/images/fish/dead.png';
      } else if (this.isFrog()) {
        this.imageUrl = 'assets/images/frog/dead.png';
      }
    } else if (action == 'sick') {
      if (this.isCat()) {
        this.imageUrl = 'assets/images/cat/sick.png';
      } else if (this.isDog()) {
        this.imageUrl = 'assets/images/dog/sick.png';
      } else if (this.isFish()) {
        this.imageUrl = 'assets/images/fish/sick.png';
      } else if (this.isFrog()) {
        this.imageUrl = 'assets/images/frog/sick.png';
      }
    } else if (action == 'sad') {
      if (this.isCat()) {
        this.imageUrl = 'assets/images/cat/sad.png';
      } else if (this.isDog()) {
        this.imageUrl = 'assets/images/dog/sad.png';
      } else if (this.isFish()) {
        this.imageUrl = 'assets/images/fish/sad.png';
      } else if (this.isFrog()) {
        this.imageUrl = 'assets/images/frog/sad.png';
      }
    } else if (action == 'tired') {
      if (this.isCat()) {
        this.imageUrl = 'assets/images/cat/tired.png';
      } else if (this.isDog()) {
        this.imageUrl = 'assets/images/dog/tired.png';
      } else if (this.isFish()) {
        this.imageUrl = 'assets/images/fish/tired.png';
      } else if (this.isFrog()) {
        this.imageUrl = 'assets/images/frog/tired.png';
      }
    }
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
      state: "normal",
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
