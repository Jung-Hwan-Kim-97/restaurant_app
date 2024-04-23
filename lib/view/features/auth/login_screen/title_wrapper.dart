import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constant/colors.dart';

class TitleWrapper extends StatelessWidget {
  const TitleWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Title(),
        SizedBox(
          height: 10,
        ),
        _SubTitle()
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: 34, fontWeight: FontWeight.w500, color: Colors.black);

    return Text('환영합니다', style: textStyle);
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: BODY_TEXT_COLOR);
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주민이 되길 :)',
      style: textStyle,
    );
  }
}
