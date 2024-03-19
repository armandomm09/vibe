
import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/edit_profile_page.dart';
import 'package:flutter_application_5/pages/login_page.dart';
import 'package:flutter_application_5/pages/main_page.dart';
import 'package:flutter_application_5/pages/profile_page.dart';
import 'package:flutter_application_5/pages/users_list.dart';

class AppRoutes{

  static const postsPage = '/postsPage';
  static const loginPage = '/login';
  static const mainPage = '/main';
  static const profilePage = '/profile';
  static const editProfilePage = '/editProfile';

  static  Map<String, WidgetBuilder> map = {
        postsPage:(context) =>  PostsPage(),
        loginPage:(context) => LoginPage(),
        mainPage:(context) => MainPage(),
        profilePage:(context) => ProfilePage(),  
        editProfilePage:(context) => EditProfilePage()

      };

}

