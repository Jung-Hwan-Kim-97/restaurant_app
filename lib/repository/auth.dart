import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restaurant_app/utils/constant/ip.dart';
import 'package:restaurant_app/utils/constant/tokens.dart';

class AuthRepository {
  final _dio = Dio();

  Future<dynamic> getToken(Map<String, String> loginData) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      final String token = stringToBase64
          .encode('${loginData['userName']}:${loginData['password']}');

      final response = await _dio.post('$baseUrl/auth/login',
          options: Options(headers: {'authorization': 'Basic $token'}));

      final accessToken = response.data['accessToken'];
      final refreshToken = response.data['refreshToken'];

      await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
      await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> tokenRefreshHandler() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    try {
      final response = await _dio.post('$baseUrl/auth/token',
          options: Options(headers: {'authorization': 'Bearer $refreshToken'}));

      await storage.delete(key: ACCESS_TOKEN_KEY);
      await storage.write(
          key: ACCESS_TOKEN_KEY, value: response.data['accessToken']);
    } catch (e) {
      print(e);
    }
  }
}
