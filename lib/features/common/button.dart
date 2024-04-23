import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  final Color backgroundColor;
  final Color foregroundColor;
  const CustomButton(
      {required this.title,
      required this.onPressed,
      this.backgroundColor = PRIMARY_COLOR,
      this.foregroundColor = Colors.white,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(8),
          )),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor),
    );
  }
}
