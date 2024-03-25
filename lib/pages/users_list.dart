import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/mainBottomBar.dart';
import 'package:flutter_application_5/components/post_item.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/configs/AppRoutes.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  
  List<String> users = [];
  int currentIndex = 0;
//[Icon(Icons.location_city)]
  @override
  Widget build(BuildContext context) {
    userList();
    return 
    Scaffold(
      appBar: Toolbar(title: "Home", actions:[
        IconButton(onPressed: () {
          Navigator.pushNamed(context, AppRoutes.nearbyPage);
        }, icon: Icon(Icons.location_city)
        )
      ]),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(user: users[index],);
        }, 
        itemCount: users.length,
         separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 20.0,
            );
          },

        ),
     
    );
  }

  

 userList(){
      for (var i = 0; i < 30; i++) {
        users.add("User number $i");
      }
}

  }