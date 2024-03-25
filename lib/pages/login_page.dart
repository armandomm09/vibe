import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_5/pages/main_page.dart';

enum LoginState{
    successfull, wrongInput, serverError
  }
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  signInWithGoogle() async {

    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential =  GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
    print(user.user?.displayName);
  }

  Future<LoginState> logIn(String username, String password) async {
    try {
      var response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {

        return LoginState.successfull;
      } else {
        return LoginState.wrongInput;
      }
    } catch (e) {
      print(e.toString());
      return LoginState.serverError;
    }
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Spacer(),
                const Text(
                  "Hello, welcome back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Login please"),
                Spacer(),
                AppTextField(hint: "Username", controller: usernameController),
                SizedBox(height: 20),
                AppTextField(hint: "Password", controller: passwordController),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("Forgot");
                    },
                    child: const Text("Password"),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(usernameController.text);
                      print(passwordController.text);

                      // Realizar inicio de sesión
                      LoginState success = await logIn(
                        usernameController.text,
                        passwordController.text,
                      );

                      // Verificar si el inicio de sesión fue exitoso
                      if (success == LoginState.successfull) {
                        // Si fue exitoso, navegar a la pantalla MainPage
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      } else if(success == LoginState.wrongInput){
                        // Si no fue exitoso, mostrar mensaje de error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Incorrect username or password.'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Something went wrong, please try again.'),
                          ),
                        );
                      }
                    },
                    child: Text("Log in"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "Or login with:",
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    print("Google pressed");
                  },
                  style: ElevatedButton.styleFrom(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png", width: 30, height: 30),
                      SizedBox(width: 10),
                      Text("Login with google"),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Github pressed");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/github.png", height: 30),
                        SizedBox(width: 12),
                        Text("Login with Github"),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: Colors.amber),
                      child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
                AppTextField(hint: "Username2"), 
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
