// @dart=2.6

import 'package:flutter/material.dart';
import 'package:pets/app.dart';
import 'flavor-config.dart';
void main() {
  FlavorConfig(
      flavor: Flavor.USER_DEV,
      values: FlavorValues(baseUrl: 'http://127.0.0.1:5000/'));
  runApp(PetsApp());
}