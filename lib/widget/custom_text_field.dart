import 'package:baitap_ui/screen_size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final Icon icon;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int? maxlength;
  final VoidCallback? showPassword;
  const CustomTextField({
    required this.controller,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    required this.onChanged,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.obscureText = false,
    this.maxlength,
    this.showPassword,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 58,
      width: maxlength != null ? ScreenSize().screenWidth - 60 - 100 : ScreenSize().screenWidth - 60,
      child: TextField(
        style: const TextStyle(
          color: Color(0xFF515151),
          fontSize: 18,
        ),
        maxLength: maxlength,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.only(left: 36, top: 18, bottom: 18, right: 12),
          fillColor: const Color(0xFFDCDCDC),
          filled: true,
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFAEAEAE),
            fontSize: 18,
          ),
          errorText: errorText,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 10,
          ),
          suffixIcon: showPassword != null ? IconButton(onPressed: showPassword, icon: icon):icon,
          suffixIconColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
