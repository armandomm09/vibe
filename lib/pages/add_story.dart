import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/auths/firebase_post.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/styles/text_styles.dart';

enum Gender{
  none,
  male, 
  female,
  other
}


class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

void _showMessage(PostState state) {
  final messenger = ScaffoldMessenger.of(context);
  final message = state == PostState.successful
      ? 'Data posted successfully!'
      : 'Failed to post data. Please try again.';
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
    backgroundColor: state == PostState.successful ? Colors.green : Colors.red, // Color del SnackBar
  );
  messenger.showSnackBar(snackBar);
}



  bool showPlayer = false;
  String? audioPath;
  late DateTime birthday;
  var currentGender = Gender.none;

  @override
  void initState() {

    super.initState();
    birthday = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {


  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: const Toolbar(title: "Cuenta tu historia "),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                AppTextField(hint: "Nombre", controller: nameController,),
                const SizedBox(height: 20),
                AppTextField(hint: "Phone number", controller: phoneNumberController,),
                const SizedBox(height: 20),
                AppTextField(hint: "Email", controller: emailController,),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      PostState state = await FirebasePoster.doPostUserInfo(
                          nameController.text,
                          emailController.text,
                          phoneNumberController.text);
                      _showMessage(state);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("Log in"),
                  ),
                ),
                  const SizedBox(height: 20),
                  FirebasePoster.getUserCollectionStream(),
                  const SizedBox(height: 20),
                  const AppTextField(hint: "Historia", maxLines: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
