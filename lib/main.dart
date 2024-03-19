import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/mainBottomBar.dart';
import 'package:flutter_application_5/configs/AppRoutes.dart';
import 'package:flutter_application_5/pages/edit_profile_page.dart';
import 'package:flutter_application_5/pages/main_page.dart';
import 'package:flutter_application_5/pages/profile_page.dart';
import 'package:flutter_application_5/pages/users_list.dart';
import 'package:flutter_application_5/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 2, 63, 161),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 29, 116, 237),
        ),
      ),
      home: LoginPage(),
      routes: AppRoutes.map
      
    );
  }

}