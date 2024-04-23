import 'package:flutter/material.dart';
//FEAT
import 'package:restaurant_app/view/features/common/custom_text_form_field.dart';

class LoginTextFiledWrapper extends StatelessWidget {
  final Map<String, String> loginData;

  const LoginTextFiledWrapper({required this.loginData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          onChanged: (String value) {
            loginData['userName'] = value;
          },
          helperText: '이메일을 입력 해 주세요.',
          // isAutoFocus: true,
        ),
        SizedBox(height: 20),
        CustomTextFormField(
          onChanged: (String value) {
            loginData['password'] = value;
          },
          helperText: '비밀번호를 입력 해 주세요.',
          isObscureText: true,
        )
      ],
    );
  }
}
