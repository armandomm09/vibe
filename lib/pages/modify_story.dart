import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/auths/firebase_post.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/pages/update_form.dart';
import 'package:flutter_application_5/styles/app_colors.dart';
import 'package:flutter_application_5/styles/text_styles.dart';

class ModifyStory extends StatefulWidget {
  final String clientId;
  const ModifyStory({super.key, required this.clientId});

  @override
  _ModifyStoryState createState() => _ModifyStoryState();
}

class _ModifyStoryState extends State<ModifyStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Toolbar(titleWidget: "Modify story"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("formData2")
              .doc(widget.clientId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            } 
              var output = snapshot.data!.data();
              var name = output?["Name"];
              var email = output?["email"];
              var phoneNumber = output?["phonenumber"];

              print(name);
              print(email);
              print(phoneNumber);

              return Padding(
                padding: EdgeInsets.all(10),
                child: UpdateForm(
                    name: name,
                    email: email,
                    phoneNumber: phoneNumber,
                    clientId: widget.clientId),
              );
          },
        ));
  }
}
