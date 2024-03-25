import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginState{
    successfull, wrongInput, serverError
  }

class GoogleAuthService {
  static Future<LoginState> signInWithGoogle() async {
    try {
      await Firebase.initializeApp();
      
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      
      if (googleUser == null) {
        return LoginState.wrongInput;
      }

      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);

      return LoginState.successfull;
    } catch (e) {
      print(e.toString());
      return LoginState.serverError;
    }
  }
}