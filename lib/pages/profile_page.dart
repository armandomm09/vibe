import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/components/user_avatar.dart';
import 'package:flutter_application_5/configs/AppRoutes.dart';
import 'package:flutter_application_5/styles/text_styles.dart';

enum ProfileMenuState {
  EDIT,
  LOG_OUT
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Toolbar(titleWidget: "Profile", actions: [
        PopupMenuButton(onSelected: (value) {
          switch(value){
            case ProfileMenuState.EDIT:
              Navigator.pushNamed(context, AppRoutes.editProfilePage);
              break;

            case ProfileMenuState.LOG_OUT:
              print("Log out");
              break;
          }
        },
        icon: const Icon(Icons.more_vert_sharp),
        iconColor: Colors.amber,
          itemBuilder: (context){
          return [
            const PopupMenuItem(value: ProfileMenuState.EDIT,child: Text("Edit"),),
            const PopupMenuItem(value: ProfileMenuState.LOG_OUT,child: Text("Log out"),),
          ];}, 
          color: Colors.amber,)
      ],),
      body: const Column(
        children: [
          UserAvatar(size: 100,),
          SizedBox(height: 10,),
          Text("Armando", style: AppText.header2),
          Text("Mac Beath", style: AppText.subtitle3,),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("5887", style: AppText.header2),
                  Text("Followers", style: TextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: [
                  Text("190", style: AppText.header2),
                  Text("Touches", style: TextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: [
                  Text("2593", style: AppText.header2),
                  Text("Following", style: TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
          Divider(thickness: 4, height: 20, color: Colors.amber)
        ],
      ),
    );
  }
}