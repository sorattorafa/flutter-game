import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
  int id;
  int userId;
  String email;
  String password;

  UserModel({
    @required this.email,
    this.password,
  });

  UserModel userFromJson(String source) {
    final json = jsonDecode(source);
    return UserModel.fromJson(json);
  }

  String userModelToJson(UserModel source) {
    final data = source.toJson();
    return jsonEncode(data);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "email": email,
      };
}
