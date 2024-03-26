import 'package:flutter/material.dart';
import 'package:flutter_application_5/auths/google_auth.dart';
import 'package:flutter_application_5/auths/reqres_auth.dart';
import 'package:flutter_application_5/components/app_textfield.dart';
import 'package:flutter_application_5/pages/appmanager.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  

  

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  "Hello, welcome back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Login please"),
                const Spacer(),
                AppTextField(hint: "Username", controller: usernameController),
                const SizedBox(height: 20),
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
                      LoginState success = await ReqresAuthService.logInWithReqres(
                        usernameController.text,
                        passwordController.text,
                      );

                      // Verificar si el inicio de sesión fue exitoso
                      if (success == LoginState.successfull) {
                        // Si fue exitoso, navegar a la pantalla MainPage
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      } else if(success == LoginState.wrongInput){
                        // Si no fue exitoso, mostrar mensaje de error
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Incorrect username or password.'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Something went wrong, please try again.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("Log in"),
                  ),
                ),
                const Spacer(),
                const Text(
                  "Or login with:",
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    LoginState success = await GoogleAuthService.signInWithGoogle();

                      // Verificar si el inicio de sesión fue exitoso
                      if (success == LoginState.successfull) {
                        // Si fue exitoso, navegar a la pantalla MainPage
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      } else if(success == LoginState.wrongInput){
                        // Si no fue exitoso, mostrar mensaje de error
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Incorrect username or password.'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Something went wrong, please try again.'),
                          ),
                        );
                      }
                  },
                  style: ElevatedButton.styleFrom(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png", width: 30, height: 30),
                      const SizedBox(width: 10),
                      const Text("Login with google"),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      print("Github pressed");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/github.png", height: 30),
                        const SizedBox(width: 12),
                        const Text("Login with Github"),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: Colors.amber),
                      child: const Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
                const AppTextField(hint: "Username2"), 
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
