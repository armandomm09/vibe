import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/components/user_avatar.dart';
import 'package:flutter_application_5/styles/text_styles.dart';

enum Gender{
  none,
  male, 
  female,
  other
}


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late DateTime birthday;
  var currentGender = Gender.none;

  @override
  void initState() {
    super.initState();
    birthday = DateTime(2000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: "Edit Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: UserAvatar(size: 120),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const AppTextField(hint: "First name"),
              const SizedBox(height: 20),
              const AppTextField(hint: "Last name"),
              const SizedBox(height: 20),
              const AppTextField(hint: "Phone number"),
              const SizedBox(height: 20),
              const AppTextField(hint: "Location"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: birthday,
                    firstDate: DateTime(0),
                    lastDate: DateTime(2025),
                  );
                  if (newDate != null) {
                    setState(() {
                      birthday = newDate; // Actualizando la variable birthday
                    });
                  }
                },
                child: Text("${birthday.day}/${birthday.month}/${birthday.year}"),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(167, 125, 189, 242), 
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  
                  ),
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Text("Gender", style: AppText.header3,),
                    Row(
                      children: [
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("Male", style: AppText.subtitle1,),
                        value: Gender.male, 
                        groupValue: currentGender, 
                        onChanged: (value) {
                          setState(() {
                            currentGender = Gender.male;
                          });
                        },
                        fillColor: MaterialStatePropertyAll(Colors.amber),),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("Female", style: AppText.subtitle1,),
                        value: Gender.female, 
                        groupValue: currentGender, 
                        onChanged: (value) {
                          setState(() {
                            currentGender = Gender.female;
                          });
                        },
                        fillColor: MaterialStatePropertyAll(Colors.amber),),
                    ),
                      
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Other", style: AppText.subtitle1,),
                        value: Gender.other, 
                        groupValue: currentGender, 
                        onChanged: (value) {
                          setState(() {
                            currentGender = Gender.other;
                          });
                        },
                        fillColor: MaterialStatePropertyAll(Colors.amber),),
                    ),
                      ],
                    ),
                  ],
                ),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
