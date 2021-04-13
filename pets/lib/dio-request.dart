import 'package:dio/dio.dart';

/// Class to manage the network request of the application.
class NetworkRequest {
  NetworkRequest._();

  static Dio _instance;
  static String _token;

  /// The main Dio instance, this will always exists.
  ///
  /// It is responsible for putting the main headers and the base Url.
  static Dio get dio => _instance ??= Dio();

  /// Removes the token being sent.
  static void removeToken() => _token = null;

  /// Sets the token to send.
  static set token(String newToken) => _token = newToken;

  static bool get hasToken => _token != null && _token.isNotEmpty;
}

Dio networkRequest() => NetworkRequest.dio;
