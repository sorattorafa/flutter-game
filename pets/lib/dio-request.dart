import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Class to manage the network request of the application.
class NetworkRequest {
  NetworkRequest._();

  static Dio _instance;
  static String _token;

  /// The main Dio instance, this will always exists.
  ///
  /// It is responsible for putting the main headers and the base Url.
  static Dio get dio => _instance ??= Dio()
    ..options.baseUrl = FlavorConfig.instance.values.baseUrl
    ..interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      if (_token != null) {
        options.headers['x-auth-token'] = _token;
      }
    }));

  /// Removes the token being sent.
  static void removeToken() => _token = null;

  /// Sets the token to send.
  static set token(String newToken) => _token = newToken;

  static bool get hasToken => _token != null && _token.isNotEmpty;
}

Dio networkRequest() => NetworkRequest.dio;

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
