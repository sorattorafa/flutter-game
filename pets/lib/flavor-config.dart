import 'package:flutter/foundation.dart';

enum Flavor { USER_PRODUCTION, USER_DEV, DRIVER_PRODUCTION, DRIVER_DEV }

class FlavorValues {
  FlavorValues({@required this.baseUrl});

  final String baseUrl;
}

class FlavorConfig {
  factory FlavorConfig(
      {@required Flavor flavor, @required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.values);

  final Flavor flavor;
  final FlavorValues values;

  static FlavorConfig _instance;

  static FlavorConfig get instance => _instance;

  static bool get isProduction =>
      _instance.flavor == Flavor.USER_PRODUCTION ||
      _instance.flavor == Flavor.DRIVER_PRODUCTION;

  static bool get isDevelopment =>
      _instance.flavor == Flavor.USER_DEV ||
      _instance.flavor == Flavor.DRIVER_DEV;

  static bool get isUser =>
      _instance.flavor == Flavor.USER_PRODUCTION ||
      _instance.flavor == Flavor.USER_DEV;

  static bool get isDriver =>
      _instance.flavor == Flavor.DRIVER_PRODUCTION ||
      _instance.flavor == Flavor.DRIVER_DEV;
}
