import 'dart:convert';

class UserModel {
  int? id;
  String email;
  String? password;

  UserModel({
    required this.email,
    this.id,
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
        id: json["id"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "email": email,
      };
}
