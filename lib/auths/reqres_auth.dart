import 'package:flutter_application_5/auths/google_auth.dart';
import 'package:flutter_application_5/pages/login_page.dart';



class ReqresAuthService {
  static get http => null;


 static Future<LoginState> logInWithReqres(String username, String password) async {
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
  
}