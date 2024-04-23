import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';
final storage = FlutterSecureStorage();

// tokenValidator() async {
//   DateTime now = DateTime.now();
//   int convertMillisecond = now.millisecondsSinceEpoch;
//   final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
//   final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
//
//   // 토큰이없는경우,
//   if ((accessToken == null || refreshToken == null)) {
//     return false;
//   }
//   // refreshToken이 만료된 경우
//   Map<String, dynamic> refreshTokenData = Jwt.parseJwt(refreshToken!);
//   final refreshTokenExp = refreshTokenData['exp'] * 1000;
//
//   if (convertMillisecond > refreshTokenExp) {
//     await storage.deleteAll();
//     return false;
//   }
//
//   // accessToken이 만료된 경우 토큰 refresh해주는 로직
//   Map<String, dynamic> accessTokenData = Jwt.parseJwt(accessToken!);
//   final accessTokeExp = accessTokenData['exp'] * 1000;
//
//   if (convertMillisecond > accessTokeExp) {
//     //토큰 리프레쉬
//     return AuthApi().tokenRefreshHandler();
//   }
// }
