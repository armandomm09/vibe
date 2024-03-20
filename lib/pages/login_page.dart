import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/components/mainBottomBar.dart';
import 'package:flutter_application_5/pages/users_list.dart';
import 'package:flutter_application_5/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:  SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                children:  [
                  Spacer(),
                  const Text("Hello, welcome back", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  const Text("Login please"),
                  Spacer(),
                  const AppTextField(hint: "Username"),
                  SizedBox(height: 20,),
                  const AppTextField(hint: "Password"),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {
                      print("Forgot");
                    }, child: const Text("Password")),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context){
                          return MainBottomBar ();
                        }));
                      }, child: Text("Log in"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black
                    ),),
                  ),
                  Spacer(),
                  Text("Or login with:", style: TextStyle(color: Colors.white),),
                  Spacer(),
                  ElevatedButton(onPressed: () {print("Google pressed");}, 
                  style: ElevatedButton.styleFrom(
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png", width: 30, height: 30),
                      SizedBox(width: 10),
                      Text("Login with google")
                    ],
                  )
                 ),
                 SizedBox(height: 8,),
                 SizedBox(
                  height: 40,
                  width: 400,
                   child: ElevatedButton(onPressed: () {print("Github pressed");}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/github.png", height: 30,),
                        SizedBox(width: 12,),
                        Text("Login with Github")
                      ],
                    )),
                 ),
                  Row(
                    children: [
                      Text("Don't have an account?", style: TextStyle(color: Colors.white),),
                      TextButton(onPressed: () {}, style: TextButton.styleFrom(foregroundColor: Colors.amber), child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),))
                    ],
                  ),
                  AppTextField(hint: "Username2"),
                  Spacer()
                ],
                        ),
              ),
            ),
          ),
      );
  }
}