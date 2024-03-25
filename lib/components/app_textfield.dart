import 'package:flutter/material.dart';
import 'package:flutter_application_5/styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  // ignore: non_constant_identifier_names
  const AppTextField({super.key, required this.hint, this.maxLines = 1, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      minLines: 1,
      maxLines: maxLines,
      decoration: InputDecoration(
       // hintText: hint, 
        labelText: hint,
        labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent)
      ),  
      filled: true, fillColor: AppColors.persianGreen));
  }
}