import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  String hint;
  String label;
  String? errorText;
  TextEditingController textEditingController;
  bool obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  int? maxLine;

  TextInputWidget(
      {required this.hint,
      required this.label,
      this.errorText,
      required this.textEditingController,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      maxLines: maxLine,
      controller: textEditingController,
      obscureText: obscureText,
      style: TextStyle(color: Colors.green),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text(
          label,
          style: TextStyle(color: Colors.green.shade300),
        ),
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
