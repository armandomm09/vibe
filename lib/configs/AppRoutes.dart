

import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/add_story.dart';
import 'package:flutter_application_5/pages/edit_profile_page.dart';
import 'package:flutter_application_5/pages/login_page.dart';
import 'package:flutter_application_5/pages/appmanager.dart';
import 'package:flutter_application_5/pages/modify_story.dart';
import 'package:flutter_application_5/pages/nearby_page.dart';
import 'package:flutter_application_5/pages/profile_page.dart';
import 'package:flutter_application_5/pages/posts_page.dart';

class AppRoutes{

  static const postsPage = '/postsPage';
  static const loginPage = '/login';
  static const mainPage = '/main';
  static const profilePage = '/profile';
  static const editProfilePage = '/editProfile';
  static const nearbyPage = '/nearbyPage';
  static const addStoryPage ='/addStoryPage';
  static const modifyStoryPage ='/modifyStoryPage'; 



  static  Map<String, WidgetBuilder> map = {
        postsPage:(context) =>  const PostsPage(),
        loginPage:(context) => const LoginPage(),
        mainPage:(context) => const MainPage(),
        profilePage:(context) => const ProfilePage(),  
        editProfilePage:(context) => const EditProfilePage(),
        nearbyPage:(context) => const NearbyPage(),
        addStoryPage:(context) => const AddPost(),
        modifyStoryPage:(context) => const ModifyStory(),

      };

}

