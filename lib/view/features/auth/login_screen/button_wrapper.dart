import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/repository/auth.dart';
//FEAT
import 'package:restaurant_app/view/features/common/button.dart';
//API

class ButtonWrapper extends StatelessWidget {
  final Map<String, String> loginData;

  const ButtonWrapper({required this.loginData, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_SignInButton(loginData: loginData), _SignUpButton()],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  final Map<String, String> loginData;

  const _SignInButton({required this.loginData, super.key});

  @override
  Widget build(BuildContext context) {
    final authApi = AuthRepository();

    return CustomButton(
        title: '로그인',
        onPressed: () =>
            authApi.getToken(loginData).then((value) => context.go('/home')));
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: '회원가입',
      onPressed: () {},
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
