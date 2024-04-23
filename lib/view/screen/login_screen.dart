import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/view/features/auth/login_screen/button_wrapper.dart';
import 'package:restaurant_app/view/features/auth/login_screen/login_text_filed_wrapper.dart';
import 'package:restaurant_app/view/features/auth/login_screen/logo.dart';
//LAYOUT
import 'package:restaurant_app/view/layout/index.dart';

//FEAT
import '../features/auth/login_screen/title_wrapper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> loginData = {'userName': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.vertical,
      child: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          print(loginData);
        },
        child: Column(
          children: [
            TitleWrapper(),
            Logo(),
            SizedBox(
              height: 70,
            ),
            LoginTextFiledWrapper(
              loginData: loginData,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWrapper(loginData: loginData)
          ],
        ),
      ),
    ));
  }
}
