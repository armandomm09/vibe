import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/auths/firebase_post.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/styles/app_colors.dart';
import 'package:flutter_application_5/styles/text_styles.dart';



class ModifyStory extends StatefulWidget {
  const ModifyStory({super.key});

  @override
  _ModifyStoryState createState() => _ModifyStoryState();
}

class _ModifyStoryState extends State<ModifyStory> {

  String selectedUser = "0";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Toolbar(titleWidget: 
      "Modify story"),
      body: Column(
        children: [
          Center(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("formData2").snapshots(),
              builder: (context, snapshot) {
                List<DropdownMenuItem> clientItems = [];
                clientItems.add(
                    DropdownMenuItem(child: Text("Select value"), value: "0",)
                  );
                if(!snapshot.hasData){
                  CircularProgressIndicator();
                } else {
                  final clients = snapshot.data?.docs.reversed.toList();
                  
                  for(var client in clients!){
                    clientItems.add(DropdownMenuItem(
                      value: client.id,
                      child: Text(client["Name"])
                      ));
                  }
                }
                return DropdownButton(items: clientItems, onChanged: (clientValue) {
                  setState(() {
                    selectedUser = clientValue;
                  });
                  print(clientValue);
                },
                focusColor: AppColors.extraTone,
                dropdownColor: AppColors.extraTone,
                isExpanded: false,
                value: selectedUser,
                );
              },
            ),
          )
        ],)
    );
  }
}
