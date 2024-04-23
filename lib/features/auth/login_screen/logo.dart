import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/misc/logo.png',
      width: MediaQuery.of(context).size.width,
    );
  }
}
