import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/add_story.dart';
import 'package:flutter_application_5/pages/profile_page.dart';
import 'package:flutter_application_5/pages/posts_page.dart';
import 'package:flutter_application_5/pages/search_stories.dart';
import 'package:flutter_application_5/pages/visualizer_3d.dart';
import 'package:flutter_application_5/styles/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  NavigationBarState currentIndex = NavigationBarState.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      MyBottomNavigation(
        currentValue: currentIndex, 
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        }),
      //appBar: AppBar(title: const Text("Nav Container"),),
      body: pages[currentIndex.index],
      extendBody: true,
    );
  }
}

final pages = [
  const PostsPage(),
  const SearchStories(),
  const AddPost(),
  const RobotViewer(),
  const ProfilePage()
];

enum NavigationBarState {
  home, chat, add, like, user
}

class MyBottomNavigation extends StatelessWidget {
  final NavigationBarState currentValue;
  final ValueChanged<NavigationBarState> onTap;
  const MyBottomNavigation({super.key, required this.currentValue, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: const EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: BoxDecoration(color: AppColors.extraTone, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(child: IconButton(
                    onPressed: () {
                      onTap(NavigationBarState.home);
                    }, 
                    icon: Icon(
                      currentValue == NavigationBarState.home ? Icons.home_filled : Icons.home_outlined
                      ))),
                  Expanded(child: IconButton(
                    onPressed: () {
                      onTap(NavigationBarState.chat);
                    }, 
                    icon: Icon(
                      currentValue == NavigationBarState.chat ? Icons.chat_bubble : Icons.chat_bubble_outline
                    ))),
                  const Spacer(),
                  Expanded(child: IconButton(
                    onPressed: () {
                      onTap(NavigationBarState.like);
                    }, 
                    icon: Icon(
                      currentValue == NavigationBarState.like ? Icons.heart_broken : Icons.heart_broken_outlined
                    ))),
                  Expanded(child: IconButton(
                    onPressed: () {
                      onTap(NavigationBarState.user);
                    }, 
                    icon: Icon(
                      currentValue == NavigationBarState.user ? Icons.person_2 : Icons.person_2_outlined
                    ))),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(NavigationBarState.add),
              child: Container(
                width: 64,
                height: 64,
                decoration:  BoxDecoration(
                  color: AppColors.extraTone,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.add, size: 40, weight: 100, color: AppColors.counterColor,),
              ),
            ),
          )
        ],
      ),
    );
  }
}