import 'package:flutter/material.dart';
import 'package:flutter_application_5/styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  const AppTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
       // hintText: hint, 
        labelText: hint,
        labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent)
      ),  
      filled: true, fillColor: AppColors.fieldColor));
  }
}