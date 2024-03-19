import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/components/user_avatar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: "Edit Profile"),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Stack(
              children: [
                UserAvatar(size: 120,),
                Positioned(bottom: 0, 
                right: 0,child: 
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(50 )),
                  ),
                    child: const Icon(Icons.edit, color: Colors.white,)
                ),)
              ],
            ),
            const AppTextField(hint: "First name",), 
            const SizedBox(height: 20,),
            const AppTextField(hint: "Last name",),
            const SizedBox(height: 20,),
            const AppTextField(hint: "Phone number",),
            const SizedBox(height: 20,),
            const AppTextField(hint: "Location",),
        
          ],
        ),
      ),
    );
  }
}