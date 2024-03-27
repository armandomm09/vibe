



import 'package:flutter/material.dart';

class AppColors {

  static bool isRedMode = true;
  

  static Color primary = Color.fromARGB(255, 178, 41, 41);
  static Color fieldColor = Color.fromARGB(148, 216, 32, 32);
  static Color appBar = Color.fromARGB(255, 86, 5, 5);
  static Color scaffoldBackground = Color.fromARGB(255, 133, 73, 73);
  static Color extraTone = Color.fromARGB(255, 0, 0, 0);
  static Color mint = Color.fromARGB(255, 167, 38, 38);
  static Color persianGreen = Color.fromARGB(255, 102, 14, 14);
  static Color textColor = Color.fromARGB(255, 0, 0, 0);
  static Color counterColor = Colors.white;

  static setAppRedMode(bool setRedMode){

    if(setRedMode){
      primary = Color.fromARGB(255, 178, 41, 41);
      fieldColor = Color.fromARGB(148, 216, 32, 32);
      appBar = Color.fromARGB(255, 86, 5, 5);
      scaffoldBackground = Color.fromARGB(255, 133, 73, 73);
      extraTone = Color.fromARGB(255, 0, 0, 0);
      mint = Color.fromARGB(255, 167, 38, 38);
      persianGreen = Color.fromARGB(255, 102, 14, 14);
      textColor = Color.fromARGB(255, 0, 0, 0);
      counterColor = Colors.white;
    } else {
      primary = Color.fromARGB(255, 41, 116, 178);
      fieldColor = Color.fromARGB(167, 32, 126, 202).withOpacity(1);
      appBar = Color.fromARGB(255, 0, 128, 115);
      scaffoldBackground = Color.fromARGB(255, 140, 188, 185);
      extraTone = Color.fromARGB(255, 201, 160, 71);
      mint = Color.fromARGB(255, 106, 173, 123);
      persianGreen = Color.fromARGB(255, 70, 158, 150);
      textColor = Colors.black;
    }

  }

  /*

  
  */ 
}