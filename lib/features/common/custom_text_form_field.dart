import 'package:flutter/material.dart';
//CONSTANT
import 'package:restaurant_app/utils/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? helperText;
  final String? errorText;
  final bool isObscureText;
  final bool isAutoFocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField(
      {this.helperText,
      this.errorText,
      this.isObscureText = false,
      this.isAutoFocus = false,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    final defaultBorderStyle = OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: INPUT_BORDER_COLOR));

    final focusBorderStyle = defaultBorderStyle.copyWith(
        borderSide:
            defaultBorderStyle.borderSide.copyWith(color: PRIMARY_COLOR));

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      decoration: InputDecoration(
        //style
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: INPUT_BG_COLOR,
        focusedBorder: focusBorderStyle,
        border: defaultBorderStyle,
        hintStyle: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14),
        hintText: helperText,
        errorText: errorText,
      ),
      obscureText: isObscureText,
      autofocus: isAutoFocus,
      onChanged: onChanged,
    );
  }
}
