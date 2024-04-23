import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:restaurant_app/repository/auth.dart';
import 'package:restaurant_app/utils/constant/colors.dart';
import 'package:restaurant_app/utils/constant/tokens.dart';
import 'package:restaurant_app/view/layout/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with RouteAware {
  @override
  void initState() {
    super.initState();

    tokenValidator();
  }

  tokenValidator() async {
    DateTime now = DateTime.now();
    int today = now.millisecondsSinceEpoch;
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final Map<String, dynamic> accessTokenData = Jwt.parseJwt(accessToken!);
    final accessTokeExp = accessTokenData['exp'] * 1000;

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final Map<String, dynamic> refreshTokenData = Jwt.parseJwt(refreshToken!);
    final refreshTokenExp = refreshTokenData['exp'] * 1000;

    if (mounted) {
      // 토큰이없는경우,
      if ((accessToken == null || refreshToken == null)) {
        return context.go('/login');
      }
      // refreshToken이 만료된 경우
      else if (today > refreshTokenExp) {
        await storage.deleteAll();
        return context.go('/login');
      }
      // accessToken이 만료된 경우 토큰 refresh해주는 로직
      else if (today > accessTokeExp) {
        //토큰 리프레쉬
        return AuthRepository()
            .tokenRefreshHandler()
            .then((value) => Future.delayed(Duration(seconds: 3), () {
                  context.go('/home');
                }));
      } else {
        return context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: PRIMARY_COLOR,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/img/logo/logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              SizedBox(
                height: 16,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
