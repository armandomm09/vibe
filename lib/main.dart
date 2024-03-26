import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/configs/AppRoutes.dart';
import 'package:flutter_application_5/firebase_options.dart';
import 'package:flutter_application_5/pages/login_page.dart';
import 'package:flutter_application_5/styles/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 29, 43, 237),),
      ),
      home: const LoginPage(),
      routes: AppRoutes.map
      
    );
  }

}