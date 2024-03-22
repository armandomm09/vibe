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


class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
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
    return Scaffold(
      appBar: Toolbar(title: "Cuenta tu historia "),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const AppTextField(hint: "Nombre"),
                const SizedBox(height: 20),
                const AppTextField(hint: "Phone number"),
                const SizedBox(height: 20),
                const AppTextField(hint: "Location"),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
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
                  AppTextField(hint: "Historia", maxLines: 20,),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
